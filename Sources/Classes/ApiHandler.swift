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
    
    
    

    
    
    
    public static func methodForPost(url: String, params: [String: Any], completion: @escaping (Any?, String?) -> Void) {
        // Create a URL for the API endpoint
        guard let url = URL(string: url) else {
            return
        }
//        print("CHECK DETAILS FROM HERE")
//        print(url)
//        print(params)
        // Create a URLRequest with the URL, setting the HTTP method to "POST"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Add headers if needed
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        guard let jsonData = try? JSONSerialization.data(withJSONObject: params) else {
            completion("", "Error")
            return
        }

        // Set the request body with your encoded parameters
        request.httpBody = jsonData

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
                    // Process the data, e.g., convert it to a Swift object
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let jsonObject = json as? [String: Any] {
                            if let message = jsonObject["message"] as? String {
                               
                                completion("", message + "++")
                                return
                                // Use the message as needed
                            } else {
                                completion("", error?.localizedDescription)
                                return
                            }
                        }
                        else {
                            completion("", error?.localizedDescription)
                            return
                        }
                        
                    } 
                    catch {
                        completion("", error.localizedDescription)
                        return
                    }
                }
                
                completion("", error?.localizedDescription)
                return
            }
            
            if let data = data {
                // Process the data, e.g., convert it to a Swift object
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(json, "")
                } catch {
                    completion("", error.localizedDescription)
                }
            }
        }

        // Resume the data task to initiate the request
        task.resume()
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
                //                completion("", error?.localizedDescription)
                //                return
                
                
                if let data = data {
                    // Process the data, e.g., convert it to a Swift object
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let jsonObject = json as? [String: Any] {
                            if let message = jsonObject["message"] as? String {
                                
                                completion("", message + "++")
                                return
                                // Use the message as needed
                            } else {
                                completion("", error?.localizedDescription)
                                return
                            }
                        }
                        else {
                            completion("", error?.localizedDescription)
                            return
                        }
                        
                    }
                    catch {
                        completion("", error.localizedDescription)
                        return
                    }
                }
                
                completion("", error?.localizedDescription)
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
                        completion("", error?.localizedDescription)
                    }
                    
                    
                } catch {
                    completion("", error.localizedDescription)
                }
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
    
    
    
    
    
    
    
    
    
    

    
}

