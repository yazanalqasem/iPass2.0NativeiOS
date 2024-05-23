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
    
    
    
    private static func addAnimationLoader() {
        
           // Set background color
        fullSizeView.backgroundColor = UIColor.black.withAlphaComponent(0.7)

           // Add the view to the main view
        iPassSDKDataManager.shared.controller.view.addSubview(fullSizeView)

           // Constrain the view to the edges of the superview
           fullSizeView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
            fullSizeView.topAnchor.constraint(equalTo: iPassSDKDataManager.shared.controller.view.topAnchor),
               fullSizeView.bottomAnchor.constraint(equalTo: iPassSDKDataManager.shared.controller.view.bottomAnchor),
               fullSizeView.leadingAnchor.constraint(equalTo: iPassSDKDataManager.shared.controller.view.leadingAnchor),
               fullSizeView.trailingAnchor.constraint(equalTo: iPassSDKDataManager.shared.controller.view.trailingAnchor)
           ])
        
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = iPassSDKDataObjHandler.shared.loaderColor
        activityIndicator.center =  iPassSDKDataManager.shared.controller.view.center
        activityIndicator.hidesWhenStopped = true
        fullSizeView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
   
    
    public static func stopLoaderAnimation() {
        fullSizeView.removeFromSuperview()
       
       
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
    
    private static func generateRandomTwoDigitNumber() -> String {
        let lowerBound = 10
        let upperBound = 999999999
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var randStr =  String((0..<10).map{ _ in letters.randomElement()! })
        
        
        var randomValue = String(Int(arc4random_uniform(UInt32((upperBound - lowerBound + 1)))) + lowerBound)
        
        let currentDate = Date()

        // Step 2: Create a DateFormatter instance
        let dateFormatter = DateFormatter()

        // Step 3: Set the desired date format
        dateFormatter.dateFormat = "yyyy-MM-ddHH-mm"

        // Step 4: Convert the date to a string
        let dateString = dateFormatter.string(from: currentDate)
        
        return "i"+randomValue+"OS" + randStr + dateString
    }
    
    public static func startScanningProcess(userEmail:String, flowId: Int, controller: UIViewController, userToken:String, appToken:String) async  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            addAnimationLoader()
        }
      
        
        
        iPassSDKDataManager.shared.userSelectedFlowId = flowId
        iPassSDKDataManager.shared.authToken = userToken
        iPassSDKDataManager.shared.token = appToken
        iPassSDKDataManager.shared.sid = generateRandomTwoDigitNumber()
        iPassSDKDataManager.shared.email = userEmail
        iPassSDKDataManager.shared.controller = controller
        if(flowId == 10031 || flowId == 10032 || flowId == 10011) {
            await createLivenessSessionID()
        }
        else {
            await oPenDocumentScanner()
        }
    }
    
    
    private static func createLivenessSessionID() {
        
        let parameters: [String: Any] = [
            CreateSessionApi.email: iPassSDKDataManager.shared.email,
            CreateSessionApi.auth_token: iPassSDKDataManager.shared.authToken
        ]
        iPassHandler.methodForPost(url: CreateSessionApi.baseApi + (iPassSDKDataManager.shared.token), params: parameters) { response, error in
            DispatchQueue.main.async {
                stopLoaderAnimation()
            }
            if(error != "") {
                print("Response",response as Any)
                if let jsonRes = response as? [String: Any] {
                    print("Response",jsonRes)
                    if let sessionId = jsonRes["sessionId"] as? String  {
                        iPassSDKDataManager.shared.sessionId = sessionId
                        Task { @MainActor in
                            await oPenDocumentScanner()
                        }
                    }
                    else {
                        self.delegate?.getScanCompletionResult(result: "", error: "Error in creating session")
                    }
                }
                else {
                    self.delegate?.getScanCompletionResult(result: "", error: "Error in creating session")
                }
            }
            else {
                self.delegate?.getScanCompletionResult(result: "", error: "Error in creating session")
            }
            
        }
    }
    
    private static func oPenDocumentScanner() async {
       await setDocumentScannerProperties()
        startDocumentProcessing()
    }
    
    private static func setDocumentScannerProperties() async{
        DocReader.shared.processParams.returnUncroppedImage = true
        DocReader.shared.processParams.multipageProcessing = true
        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkHolo = false
        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkOVI = false
        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkMLI = false
        
        var translationDictionary = [String : String]()
       // ENG, AR, FR, SP, TURKISH, URDU, GERMAN, KURDISH
        var currentLanguage = "en"
        if let preferredLanguageCode = Locale.preferredLanguages.first {
             currentLanguage = Locale(identifier: preferredLanguageCode).languageCode ?? "en"
            print("Device's preferred language code: \(currentLanguage)")
          
        } else {
            print("Unable to determine the device's preferred language code.")
        }
        if(currentLanguage.lowercased() == "en") {
            let dataValues = EnglishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        else if(currentLanguage.lowercased() == "ar") {
            let dataValues = ArabicDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        else if(currentLanguage.lowercased() == "fr") {
            let dataValues = FrenchDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        else if(currentLanguage.lowercased() == "sp") {
            let dataValues = SpanishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        else if(currentLanguage.lowercased() == "tr") {
            let dataValues = TurkishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        else if(currentLanguage.lowercased() == "ur") {
            let dataValues = UrduDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        else if(currentLanguage.lowercased() == "de") {
            let dataValues = GermanDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        else if(currentLanguage.lowercased() == "ku") {
            let dataValues = KurdishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        else {
            let dataValues = EnglishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        DocReader.shared.localizationHandler = { localizationKey in
            if let updatedString = translationDictionary[localizationKey] {
                return updatedString
            }
            return nil
        }
        
    }
    
    private static func startDocumentProcessing() {
        
        let config = DocReader.ScannerConfig(scenario: "")
        config.scenario = RGL_SCENARIO_FULL_AUTH
        DocReader.shared.showScanner(presenter: iPassSDKDataManager.shared.controller, config: config) { [self] (action, docResults, error) in
            if action == .complete || action == .processTimeout {
               
                if docResults?.chipPage != 0  {
                    DocReader.shared.startRFIDReader(fromPresenter: iPassSDKDataManager.shared.controller, completion: {  []  (action, results, error) in
                        switch action {
                        case .complete:
                            guard results != nil else {
                                self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
                                return
                            }
                            DispatchQueue.main.async {
                                iPassSDKDataObjHandler.shared.resultScanData = results!
                                Task { @MainActor in
                                   // await startCamera()
                                }
                            }
                        case .cancel:
                            guard docResults != nil else {
                                return
                            }
                            DispatchQueue.main.async {
                                iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                Task { @MainActor in
                                   // await startCamera()
                                }
                            }
                            
                        case .processTimeout:
                           
                            iPassSDKDataObjHandler.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                            guard docResults != nil else {
                                return
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                Task { @MainActor in
                                    //await startCamera()
                                }
                            }

                            
                        case .error:
                            print("Error")
                            iPassSDKDataObjHandler.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                            guard docResults != nil else {
                                return
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                Task { @MainActor in
                                    //await startCamera()
                                }
                            }
                            
                        default:
                            break
                        }
                    })
                
                }
                else {
                    DispatchQueue.main.async {
                        iPassSDKDataObjHandler.shared.resultScanData = docResults!
                        Task { @MainActor in
                            //await startCamera()
                        }
                    }
                }
                
            }
            else  if action == .cancel  {
                self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
            }
            else  if action == .processTimeout  {
                self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
            }
        }
    }
    
    
    
}
