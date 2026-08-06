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
        } catch let error as AuthError {
        } catch {
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
            } else {
            }
        } catch let error as AuthError {
        } catch {
        }
    }
    
    
    
    
    private static func convertStringToJSON(_ jsonString: String) -> Any? {
        // Convert the string to Data
        guard let jsonData = jsonString.data(using: .utf8) else {
            return nil
        }
        
        // Use JSONSerialization to parse the data into a JSON object (Dictionary or Array)
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            return jsonObject
        } catch {
            return nil
        }
    }
    
    
    

    
    
    
    public static func methodForPost(url: String,
                                     params: [String: Any],
                                     completion: @escaping (Any?, String?) -> Void) {

        // Create URL
        guard let url = URL(string: url) else {
            completion(nil, "Invalid URL")
            return
        }

        // Create Request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Encode Parameters
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            request.httpBody = jsonData

            // MARK: - Request Log
            print("\n================== API REQUEST ==================")
            print("URL        : \(url.absoluteString)")
            print("Method     : \(request.httpMethod ?? "")")
            print("Headers    : \(request.allHTTPHeaderFields ?? [:])")

            if let body = String(data: jsonData, encoding: .utf8) {
                print("Body:\n\(body)")
            }

            print("=================================================\n")

        } catch {
            completion(nil, error.localizedDescription)
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in

            // MARK: - Error
            if let error = error {
                print("\n❌ Network Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil, error.localizedDescription)
                }
                return
            }

            // MARK: - Response Log
            if let httpResponse = response as? HTTPURLResponse {

                print("\n================== API RESPONSE =================")
                print("Status Code : \(httpResponse.statusCode)")
                print("Headers     : \(httpResponse.allHeaderFields)")

                if let data = data,
                   let responseString = String(data: data, encoding: .utf8) {
                    print("Raw Response:\n\(responseString)")
                }

                print("=================================================\n")
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(nil, "Invalid response")
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, "No response data")
                }
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])

                // Print Parsed JSON
                print("✅ Parsed JSON:")
                print(json)

                if (200...299).contains(httpResponse.statusCode) {

                    DispatchQueue.main.async {
                        completion(json, nil)
                    }

                } else {

                    if let dict = json as? [String: Any],
                       let message = dict["message"] as? String {

                        DispatchQueue.main.async {
                            completion(nil, message)
                        }
                        

                    } else {

                        DispatchQueue.main.async {
                            completion(nil, "Request failed with status code \(httpResponse.statusCode)")
                        }
                    }
                }

            } catch {
                print("❌ JSON Parsing Error: \(error.localizedDescription)")

                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response String: \(responseString)")
                }

                DispatchQueue.main.async {
                    completion(nil, error.localizedDescription)
                }
            }

        }.resume()
    }
    
    
    public static func methodForGet(urlStr: String, completion: @escaping (Any?, String?) -> Void) {
        // Create a URL for the API endpoint
        
        
        if let encodedStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: encodedStr) {
            // Now you can use 'url' safely
           
        
        
        // Create a URLRequest with the URL
        let request = URLRequest(url: url)
        
        // Create a URLSessionDataTask with the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion("", error.localizedDescription)
                return
            }
            
            let httpResponseee = response as? HTTPURLResponse
            let statusCode = httpResponseee?.statusCode
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let jsonObject = json as? [String: Any] {
                            if let message = jsonObject["message"] as? String {
                                completion("", message + "++")
                                return
                            } else if let message = jsonObject["Apimessage"] as? String {
                                completion("", message + "++")
                                return
                            } else {
                                completion("", error?.localizedDescription ?? "Request failed with status code \(statusCode ?? 0)")
                                return
                            }
                        }
                        else {
                            completion("", error?.localizedDescription ?? "Request failed with status code \(statusCode ?? 0)")
                            return
                        }
                    }
                    catch {
                        completion("", error.localizedDescription)
                        return
                    }
                }
                
                completion("", error?.localizedDescription ?? "Request failed with status code \(statusCode ?? 0)")
                return
            }
            
            if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(jsonString, "")
                    }
                    else {
                        completion("", error?.localizedDescription ?? "Data parsing error")
                    }
                } catch {
                    completion("", error.localizedDescription)
                }
            } else {
                completion("", "No response data")
            }
        }
        
        // Resume the data task to initiate the request
        task.resume()
    }
        else {
            // Handle error
            completion("", "Data Processing Error")
        }
    }
    
    
    
    
    public static func methodForGetWithErrorMessages(urlStr: String, completion: @escaping (String?, String?) -> Void) {
        // Create a URL for the API endpoint
        guard let url = URL(string: urlStr) else {
            return
        }

        // Create a URLRequest with the URL
        let request = URLRequest(url: url)

        // Create a URLSessionDataTask with the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion("", "you have reached your transaction limit or you dont have access for transaction")
                return
            }
            
            let httpResponseee = response as? HTTPURLResponse
     let statusCode = httpResponseee?.statusCode
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                
                if let data = data {
                    // Process the data, e.g., convert it to a Swift object
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                                        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
                                        if let jsonString = String(data: jsonData, encoding: .utf8) {
                                            completion("", jsonString)
                                            return
                                        }
                        else {
                            completion("", "you have reached your transaction limit or you dont have access for transaction")
                            return
                        }
                        
                        
                    } catch {
                        completion("", "you have reached your transaction limit or you dont have access for transaction")
                        return
                    }
                }
                
                
                
                completion("", "you have reached your transaction limit or you dont have access for transaction")
                return
            }
            
            if let data = data {
                // Process the data, e.g., convert it to a Swift object
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                                    let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
                                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                                        completion(jsonString, "")
                                    }
                    else {
                        completion("", "you have reached your transaction limit or you dont have access for transaction")
                        return
                    }
                    
                    
                } catch {
                    completion("", "you have reached your transaction limit or you dont have access for transaction")
                    return
                }
            }
        }

        // Resume the data task to initiate the request
        task.resume()
    }
    
    
    
    

    
    
//    public static func fetchDataliveness(token: String, sessId: String, completion: @escaping (Data?, Error?) -> Void) {
//                                                     
//        if var urlComponents = URLComponents(string: "https://plusapi.ipass-mena.com/api/v1/ipass/get/liveness/facesimilarity/details") {
//            urlComponents.queryItems = [
//                URLQueryItem(name: "token", value: token),
//                URLQueryItem(name: "sessId", value: sessId)
//            ]
//            
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
    
    
    
    
    
    
    
    
    
    

    
}

