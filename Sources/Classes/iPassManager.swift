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
    var userPhoneNumber = String()
    var userSocialMediaEmail = String()
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
        activityIndicator.color = iPassSDKDataManager.shared.loaderColor
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
                completion(false, "User Login Issue")
            }
            else {
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
    
    public static func startScanningProcess(userEmail:String, flowId: Int, socialMediaEmail: String, phoneNumber: String, controller: UIViewController, userToken:String, appToken:String)   {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            addAnimationLoader()
        }
      
        
        
        iPassSDKDataManager.shared.userSelectedFlowId = flowId
        iPassSDKDataManager.shared.userSocialMediaEmail = socialMediaEmail
        iPassSDKDataManager.shared.userPhoneNumber = phoneNumber
        iPassSDKDataManager.shared.authToken = userToken
        iPassSDKDataManager.shared.token = appToken
        iPassSDKDataManager.shared.sid = generateRandomTwoDigitNumber()
        iPassSDKDataManager.shared.email = userEmail
        iPassSDKDataManager.shared.controller = controller
        if(flowId == 10031 || flowId == 10032 || flowId == 10011) {
             createLivenessSessionID()
        }
        else   if(flowId == 10015 ) {
             oPenDocumentScanner()
        }
        else {
            self.delegate?.getScanCompletionResult(result: "", error: "Work flow id is not valid")
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
                self.delegate?.getScanCompletionResult(result: "", error: "Error in creating session")
            }
            else {
                print("Response",response as Any)
                if let jsonRes = response as? [String: Any] {
                    print("Response",jsonRes)
                    if let sessionId = jsonRes["sessionId"] as? String  {
                        iPassSDKDataManager.shared.sessionId = sessionId
                             oPenDocumentScanner()
                        
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
    }
    
    private static func oPenDocumentScanner()  {
        setDocumentScannerProperties()
        
    }
    
    private static func setDocumentScannerProperties() {
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            startDocumentProcessing()
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
                                iPassSDKDataManager.shared.resultScanData = results!
                                Task { @MainActor in
                                    await startCamera()
                                }
                            }
                        case .cancel:
                            guard docResults != nil else {
                                return
                            }
                            DispatchQueue.main.async {
                                iPassSDKDataManager.shared.resultScanData = docResults!
                                Task { @MainActor in
                                    await startCamera()
                                }
                            }
                            
                        case .processTimeout:
                           
                            iPassSDKDataManager.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                            guard docResults != nil else {
                                return
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                iPassSDKDataManager.shared.resultScanData = docResults!
                                Task { @MainActor in
                                    await startCamera()
                                }
                            }

                            
                        case .error:
                            print("Error")
                            iPassSDKDataManager.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                            guard docResults != nil else {
                                return
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                iPassSDKDataManager.shared.resultScanData = docResults!
                                Task { @MainActor in
                                    await startCamera()
                                }
                            }
                            
                        default:
                            break
                        }
                    })
                
                }
                else {
                    DispatchQueue.main.async {
                        iPassSDKDataManager.shared.resultScanData = docResults!
                        Task { @MainActor in
                            await startCamera()
                        }
                    }
                }
                
            }
            else  if action == .cancel  {
                DispatchQueue.main.async {
                    stopLoaderAnimation()}
                self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
            }
            else  if action == .processTimeout  {
                DispatchQueue.main.async {
                    stopLoaderAnimation()}
                self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
            }
        }
    }
    
    public static func startCamera() async {
        await fetchCurrentAuthSession()
    }
    
    private static func fetchCurrentAuthSession() async {
        DispatchQueue.main.async {
                  addAnimationLoader()
              }
         do {
             let session = try await Amplify.Auth.fetchAuthSession()
             print("Is user signed in - \(session.isSignedIn)")
             
             print(session)
             if(session.isSignedIn == true) {
                 faceLivenessApi()
             }
             else {
                 await signIn()
             }
             
         } catch let error as AuthError {
             print("Fetch session failed with error \(error)")
         } catch {
             print("Unexpected error: \(error)")
         }
     }
    
    private static func signIn() async {
            do {
                let signInResult = try await Amplify.Auth.signIn(
                    username: "testuser",
                    password: "Apple@123"
                    )
                if signInResult.isSignedIn {
                    print("Sign in succeeded")
                    await fetchCurrentAuthSession()
                }
            } catch let error as AuthError {
                print("Sign in failed \(error)")
            } catch {
                print("Unexpected error: \(error)")
            }
        }
    
    private static func faceLivenessApi()  {
        DispatchQueue.main.async {
            stopLoaderAnimation()
            var swiftUIView = FaceClass()
            swiftUIView.sessoinIdValue = iPassSDKDataManager.shared.sessionId
            let hostingController = UIHostingController(rootView: swiftUIView)
            hostingController.modalPresentationStyle = .fullScreen
            iPassSDKDataManager.shared.controller.present(hostingController, animated: true)
          
            NotificationCenter.default.addObserver(forName: NSNotification.Name("dismissSwiftUI"), object: nil, queue: nil) { (data) in
                NotificationCenter.default.removeObserver(self)
                NotificationCenter.default.removeObserver(self, name: NSNotification.Name("dismissSwiftUI"), object: nil)

                print("userInfo from swift ui class-->> ",data.userInfo?["status"] ?? "no status value")
                hostingController.dismiss(animated: true, completion: nil)
                DispatchQueue.main.async {
                          addAnimationLoader()
                }
                startSavingDataToPanel()
            }
        }
     }
    
    private static func startSavingDataToPanel() {
        let documentDataJson = convertStringToJSON(iPassSDKDataManager.shared.resultScanData.rawResult)
        
        var userIpAddress = "Unable to get IP Address"
        
        if let ipAddress = getIPAddress() {
            print("IP Address: \(ipAddress)")
            userIpAddress = ipAddress
        }
        
        let parameters: [String: Any] = [
            SaveDataApi.sessionId: iPassSDKDataManager.shared.sessionId,
            SaveDataApi.randomid: iPassSDKDataManager.shared.sid,
            SaveDataApi.social_media_email:  iPassSDKDataManager.shared.userSocialMediaEmail ,
            SaveDataApi.phone_number:  iPassSDKDataManager.shared.userPhoneNumber ,
            SaveDataApi.ipadd: userIpAddress,
            SaveDataApi.email: iPassSDKDataManager.shared.email,
            SaveDataApi.workflow: String(iPassSDKDataManager.shared.userSelectedFlowId),
            SaveDataApi.idv_data: documentDataJson ?? "",
            SaveDataApi.source: "iOS",
            
        ]
        iPassHandler.methodForPost(url: SaveDataApi.baseApi + (iPassSDKDataManager.shared.token), params: parameters) { response, error in
            if(error != "") {
                DispatchQueue.main.async {
                    stopLoaderAnimation()
                }
                self.delegate?.getScanCompletionResult(result: "", error: "Data processing error")
            }
            else {
                print("Response",response as Any)
                startDataFetching()
            }
            
        }
    }
    
    private static func startDataFetching() {
        iPassHandler.methodForGet(urlStr: GetDataApi.baseApi + iPassSDKDataManager.shared.token + GetDataApi.sesid + iPassSDKDataManager.shared.sid) { response, error in
            DispatchQueue.main.async {
                stopLoaderAnimation()
            }
            if(error != "") {
                print("Response",response as Any)
                self.delegate?.getScanCompletionResult(result: "" , error: "Data processing error")
            }
            else {
                self.delegate?.getScanCompletionResult(result: response as! String, error: "")
            }
            
        }
        
    }
    
    private static func getIPAddress() -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>?

        // Get list of all interfaces on the device
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }

        // Loop through linked list of interfaces
        for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ptr.pointee

            // Check for IPv4 or IPv6 interface
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                
                // Check interface name
                let name = String(cString: interface.ifa_name)
                if name == "en0" || name == "pdp_ip0" { // Wi-Fi or cellular interface
                    
                    // Convert interface address to a human-readable string
                    var addr = interface.ifa_addr.pointee
                    let addrLen = (addrFamily == UInt8(AF_INET)) ? INET_ADDRSTRLEN : INET6_ADDRSTRLEN
                    var addrBuffer = [CChar](repeating: 0, count: Int(addrLen))
                    if let addressPtr = inet_ntop(Int32(addrFamily), &addr, &addrBuffer, socklen_t(addrLen)) {
                        address = String(cString: addressPtr)
                        break
                    }
                }
            }
        }

        freeifaddrs(ifaddr)
        return address
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
}
