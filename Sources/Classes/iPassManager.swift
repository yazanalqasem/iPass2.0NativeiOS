//
//  File.swift
//  
//
//  Created by MOBILE on 23/05/24.
//

import Foundation
import DocumentReader
import UIKit
import FaceLiveness
import Amplify
import SwiftUI
import Amplify
import AWSCognitoAuthPlugin


public class iPassSDKDataManager {
    public init() {}
    
    static let shared = iPassSDKDataManager()
    
    var resultScanData = DocumentReaderResults()
    var authToken = String()
    var userSelectedFlowId = Int()
    var token = String()
    var email = String()
    var sid = String()
    var controller = UIViewController()
    var sessionId = String()
    var loaderColor = UIColor(red: 126/255, green:87/255, blue: 196/255, alpha: 1.0)
}

public class configIpassSdk {
    public static func setLoaderColor(color:UIColor) {
        iPassSDKDataManager.shared.loaderColor = color
    }
}

public protocol iPassSDKManagerDelegate : AnyObject {
    func getScanCompletionResult(result : String, error : String)
}

public class iPassSDKManger {
    public init() {}
    
    public static weak var delegate : iPassSDKManagerDelegate?
    
    public static  var activityIndicator: UIActivityIndicatorView!
    
    public static  let fullSizeView = UIView()
    
    
    
    private static func addAnimationLoader(controller: UIViewController) {
        
           // Set background color
        fullSizeView.backgroundColor = UIColor.black.withAlphaComponent(0.7)

           // Add the view to the main view
        controller.view.addSubview(fullSizeView)

           // Constrain the view to the edges of the superview
           fullSizeView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               fullSizeView.topAnchor.constraint(equalTo: controller.view.topAnchor),
               fullSizeView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor),
               fullSizeView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
               fullSizeView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor)
           ])
        
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = iPassSDKDataObjHandler.shared.loaderColor
        activityIndicator.center =  controller.view.center
        activityIndicator.hidesWhenStopped = true
        fullSizeView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    public static func startLoaderAnimation() {
        fullSizeView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    public static func stopLoaderAnimation() {
        DispatchQueue.main.async {
            fullSizeView.isHidden = true
            activityIndicator.stopAnimating()
        }
       
    }
    
    
    public  static func UserOnboardingProcess(email: String, password: String, completion: @escaping (Bool?, String?) -> Void) {
        let parameters: [String: Any] = [
            UserLoginApi.email: email,
            UserLoginApi.password: password
        ]
        iPassHandler.methodForPost(url: UserLoginApi.baseApi, params: parameters) { response, error in
            if(error != "") {
                print("Response",response as Any)
                if let json = response as? [String: Any] {
                    if let user = json["user"] as? [String: Any] {
                        if let token = user["token"] as? String {
                            completion(true, token)
                        }
                        else {
                            completion(false, "")
                        }
                    }
                    else {
                        completion(false, "")
                    }
                }
                else {
                    completion(false, "")
                }
            }
        }
        
    }
    
    
}
