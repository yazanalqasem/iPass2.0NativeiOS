//
//  ApiHandler.swift
//  IpassFrameWork1
//
//  Created by Mobile on 10/04/24.
//

import Foundation
import SwiftUI
import Amplify
import FaceLiveness
import AWSPluginsCore

public class iPassHandler {
    
    
    public static  func confirmSignUp(for username: String, with confirmationCode: String) async {
        do {
            let confirmSignUpResult = try await Amplify.Auth.confirmSignUp(
                for: username,
                confirmationCode: confirmationCode
            )
            print("Confirm sign up result completed: \(confirmSignUpResult.isSignUpComplete)")
        } catch let error as AuthError {
            print("An error occurred while confirming sign up \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
    
    public static  func signUp(username: String, password: String, email: String) async {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        do {
            let signUpResult = try await Amplify.Auth.signUp(
                username: username,
                password: password,
                options: options
            )
            if case let .confirmUser(deliveryDetails, _, userId) = signUpResult.nextStep {
                print("Delivery details \(String(describing: deliveryDetails)) for userId: \(String(describing: userId))")
            } else {
                print("SignUp Complete")
            }
        } catch let error as AuthError {
            print("An error occurred while registering a user \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
    
    
    
    private static func convertStringToJSON(_ jsonString: String) -> Any? {
        // Convert the string to Data
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Failed to convert string to response data")
            return nil
        }
        
        // Use JSONSerialization to parse the data into a JSON object (Dictionary or Array)
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            return jsonObject
        } catch {
            print("Error converting JSON data: \(error)")
            return nil
        }
    }
    
    public static func saveDataPostApi(completion: @escaping (String, Error?) -> Void){
        
        guard let apiURL = URL(string: "https://plusapi.ipass-mena.com/api/v1/ipass/sdk/data/save") else { return }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let documentDataJson = convertStringToJSON(iPassSDKDataObjHandler.shared.resultScanData.rawResult)
            
        
        let livenessDataJson = convertStringToJSON(iPassSDKDataObjHandler.shared.livenessResultData)
        
        
        let parameters: [String: Any] = [
            "email": iPassSDKDataObjHandler.shared.email,
            "idvData": documentDataJson ?? "",
            "livenessdata": livenessDataJson ?? "",
            "randomid": iPassSDKDataObjHandler.shared.sid,
//            "userToken" : iPassSDKDataObjHandler.shared.authToken,
//            "appToken" : iPassSDKDataObjHandler.shared.token
        ]
        //print(parameters)
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print("Error serializing parameters: \(error.localizedDescription)")
            completion("", error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion("", error)
                return
            }
            
            let status = response.statusCode
            print("Response status code: \(status)")
            
            if status == 200 {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        
                        completion("data", nil)
                    
                    } else {
                        print("Failed to parse JSON response")
                        completion("", error)
                    }
                } catch let error {
                    print("Error parsing JSON response: \(error.localizedDescription)")
                    completion("", error)
                }
                
            } else {
                print("Unexpected status code: \(status)")
                completion("", error)
            }
        }
        task.resume()
    }
    
    
    public static func LoginAuthAPi(email: String, password: String, completion: @escaping (Bool?, String?) -> Void){
        guard let apiURL = URL(string: "https://plusapi.ipass-mena.com/api/v1/ipass/create/authenticate/login") else { return }

        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
//        print("loginPostApi",apiURL)
//        print("login parameters",parameters)
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print("Error serializing parameters: \(error.localizedDescription)")
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            let status = response.statusCode
            print("Response status code: \(status)")

            if status == 200 {
                do {
    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("Response",json)
                        if let user = json["user"] as? [String: Any] {
                            if let email = user["email"] as? String, let token = user["token"] as? String {
                                DispatchQueue.main.async {
                                    iPassSDKDataObjHandler.shared.authToken = token
                                }
                                completion(true, token)
                            } else {
                                completion(false, "Email or token not found in user dictionary")
                            }
                        } else {
                            completion(false, "User dictionary not found or is not of type [String: Any]")
                        }
                    } else {
                        completion(false, "Failed to parse JSON response")
                    }
                } catch let error {
                    completion(false, "Error parsing JSON response: \(error.localizedDescription)")
                }
            } else {
                completion(false, "Unexpected status code: \(status)")
            }
            
        }
        task.resume()
    }


    public static func createSessionApi(completion : @escaping (Bool) -> ()){
        
        guard let apiURL = URL(string: "https://plusapi.ipass-mena.com/api/v1/ipass/plus/face/session/create?token=\(iPassSDKDataObjHandler.shared.token)") else { return }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "email": iPassSDKDataObjHandler.shared.email,
            "auth_token": iPassSDKDataObjHandler.shared.authToken
        ]
        
        print("create session api url -->> ", apiURL)
        print("parameters-> ", parameters)
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print("Error serializing parameters: \(error.localizedDescription)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(false)
                return
            }
            
            let status = response.statusCode
            print("Response status code: \(status)")
            
            if status == 200 {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("createSessionApi response -->> ",json)
                        
                        if let sessionId = json["sessionId"] as? String {
                            DispatchQueue.main.async {
                                iPassSDKDataObjHandler.shared.sessionId = sessionId
                            }
                            print("sessionId ------>> ",sessionId)
                            completion(true)
                        }
                        // presentSwiftUIView()
                    } else {
                        print("Failed to parse JSON response")
                        completion(false)
                    }
                } catch let error {
                    print("Error parsing JSON response: \(error.localizedDescription)")
                    completion(false)
                }
            } else {
                print("Unexpected status code: \(status)")
                completion(false)
            }
        }
        
        task.resume()
    }
    
    
    
    public static func methodForPost(url: String, params: [String: Any], completion: @escaping (Any?, String?) -> Void) {
        // Create a URL for the API endpoint
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        print("CHECK DETAILS FROM HERE")
        
        print(url)
        print(params)

        // Create a URLRequest with the URL, setting the HTTP method to "POST"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Add headers if needed
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        guard let jsonData = try? JSONSerialization.data(withJSONObject: params) else {
            print("Error encoding parameters")
            completion("", "Error")
            return
        }

        // Set the request body with your encoded parameters
        request.httpBody = jsonData

        // Create a URLSessionDataTask with the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion("", error.localizedDescription)
                return
            }
            
                   let httpResponseee = response as? HTTPURLResponse
            let statusCode = httpResponseee?.statusCode
            print("HTTP Response Code: \(statusCode ?? 121212)")
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                completion("", error?.localizedDescription)
                return
            }
            
            if let data = data {
                // Process the data, e.g., convert it to a Swift object
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    completion(json, "")
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                    completion("", error.localizedDescription)
                }
            }
        }

        // Resume the data task to initiate the request
        task.resume()
    }
    
    
    public static func methodForGet(urlStr: String, completion: @escaping (Any?, String?) -> Void) {
        // Create a URL for the API endpoint
        guard let url = URL(string: urlStr) else {
            print("Invalid URL")
            return
        }

        // Create a URLRequest with the URL
        let request = URLRequest(url: url)

        // Create a URLSessionDataTask with the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion("", error.localizedDescription)
                return
            }
            
            let httpResponseee = response as? HTTPURLResponse
     let statusCode = httpResponseee?.statusCode
     print("HTTP Response Code: \(statusCode ?? 121212)")
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                completion("", error?.localizedDescription)
                return
            }
            
            if let data = data {
                // Process the data, e.g., convert it to a Swift object
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                                    let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
                                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                                        print("JSON Response: \(jsonString)")
                                        completion(jsonString, "")
                                    }
                    else {
                        completion("", error?.localizedDescription)
                    }
                    
                    
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                    completion("", error.localizedDescription)
                }
            }
        }

        // Resume the data task to initiate the request
        task.resume()
    }
    
    
    public static func getDataFromAPI(completion: @escaping (Data?, Error?) -> Void) {
      
        if var urlComponents = URLComponents(string: iPassSDKDataObjHandler.shared.isCustom
                                             ? "https://plusapi.ipass-mena.com/api/v1/ipass/get/document/manipulated/result"
                                             : "https://plusapi.ipass-mena.com/api/v1/ipass/get/idCard/details") {
            urlComponents.queryItems = [
                URLQueryItem(name: "token", value: iPassSDKDataObjHandler.shared.token),
                URLQueryItem(name: iPassSDKDataObjHandler.shared.isCustom ? "sesid" : "sessId", value: iPassSDKDataObjHandler.shared.sid)
            ]
            
            if let url = urlComponents.url {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    DispatchQueue.main.async {
                        completion(data, error)
                    }
                }
                
                task.resume()
            } else {
                completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            }
        }
    }
    
    
    
    // custom
//    public static func getFatchDataFromAPI(token: String, sessId: String, completion: @escaping (Data?, Error?) -> Void) {
//      
//        if var urlComponents = URLComponents(string: "https://plusapi.ipass-mena.com/api/v1/ipass/get/document/manipulated/result") {
//            urlComponents.queryItems = [
//                URLQueryItem(name: "token", value: token),
//                URLQueryItem(name: "sesid", value: sessId)
//            ]
//            
//           // print("getDataFromAPI URL----->> ", urlComponents)
//            if let url = urlComponents.url {
//                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//                    DispatchQueue.main.async {
//                        completion(data, error)
//                    }
//                }
//                
//                task.resume()
//            } else {
//                completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
//            }
//        }
//    }
    
    
    public static func fetchDataliveness(token: String, sessId: String, completion: @escaping (Data?, Error?) -> Void) {
                                                     
        if var urlComponents = URLComponents(string: "https://plusapi.ipass-mena.com/api/v1/ipass/get/liveness/facesimilarity/details") {
            urlComponents.queryItems = [
                URLQueryItem(name: "token", value: token),
                URLQueryItem(name: "sessId", value: sessId)
            ]
            
            if let url = urlComponents.url {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    DispatchQueue.main.async {
                        completion(data, error)
                    }
                }
                
                task.resume()
            } else {
                completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            }
        }
    }
    
    
    
    
    
    
    
    
    public static func getresultliveness(completion: @escaping (Data?, Error?) -> Void) {
        
        guard let apiURL = URL(string: "https://plusapi.ipass-mena.com/api/v1/ipass/plus/session/result?sessionId=\(iPassSDKDataObjHandler.shared.sessionId)&sid=\(iPassSDKDataObjHandler.shared.sid)&email=\(iPassSDKDataObjHandler.shared.email)&token=\(iPassSDKDataObjHandler.shared.token)&auth_token=\(iPassSDKDataObjHandler.shared.authToken)") else { return }

        print(apiURL)
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
//        let parameters: [String: Any] = [
//            "sessionId": iPassSDKDataObjHandler.shared.sessionId,
//            "sid": iPassSDKDataObjHandler.shared.sid,
//            "email": iPassSDKDataObjHandler.shared.email,
//            "token": iPassSDKDataObjHandler.shared.token,
//            "auth_token": iPassSDKDataObjHandler.shared.authToken
//        ]
//        print("loginPostApi",apiURL)
//        print("login parameters",parameters)
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//        } catch let error {
//            print("Error serializing parameters: \(error.localizedDescription)")
//        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            let status = response.statusCode
            print("Response status code: \(status)")

            if status == 200 {
                DispatchQueue.main.async {
                    completion(data, error)
                }
            } else {
                completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            }
            
        }
        task.resume()
    }
    
    
    public static func getresultliveness123(completion: @escaping (Data?, Error?) -> Void) {
   
      //  if var urlComponents = URLComponents(string: "https://plusapi.ipass-mena.com/api/v1/ipass/session/result/") {
        if var urlComponents = URLComponents(string: "https://plusapi.ipass-mena.com/api/v1/ipass/plus/session/result") {
            urlComponents.queryItems = [
                URLQueryItem(name: "sessionId", value: iPassSDKDataObjHandler.shared.sessionId),
                URLQueryItem(name: "sid", value: iPassSDKDataObjHandler.shared.sid),
                URLQueryItem(name: "email", value: iPassSDKDataObjHandler.shared.email),
                URLQueryItem(name: "token", value: iPassSDKDataObjHandler.shared.token),
                URLQueryItem(name: "auth_token", value: iPassSDKDataObjHandler.shared.authToken)
            ]
            print("getresultliveness URL----->> ", urlComponents)
            if let url = urlComponents.url {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    DispatchQueue.main.async {
                        completion(data, error)
                    }
                }
                task.resume()
            } else {
                completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            }
        }
    }

    
}

