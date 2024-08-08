//
//  DBDownloading.swift
//  IpassFrameWork1
//
//  Created by Mobile on 10/04/24.
//

import Foundation
import DocumentReader
import Amplify
import AWSCognitoAuthPlugin
//import Amplify
public class DataBaseDownloading{
    
    
 
    
    
    public static func initialization(completion: @escaping (String, String) -> Void) {
        
        var currentLanguage = "en"
        if let preferredLanguageCode = Locale.preferredLanguages.first {
             currentLanguage = Locale(identifier: preferredLanguageCode).languageCode ?? "en"
            print("Device's preferred language code: \(currentLanguage)")
          
        } else {
            print("Unable to determine the device's preferred language code.")
        }
        iPassSDKDataManager.shared.deviceCurrentLangauge = currentLanguage
        
        do {
           // Amplify.Logging.logLevel = .verbose
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            
            
           // try Amplify.configure()
        } catch {
        }
        
        // Custom path to your configuration file
       
        
        let configFileName = "amplifyconfiguration.json"

        if let configFileURL = Bundle.module.url(forResource: configFileName, withExtension: nil) {
            let configFilePath = configFileURL.path
            if let amplifyConfig = loadAmplifyConfiguration(from: configFilePath) {
                // Configure Amplify with the loaded configuration
                do {
                    try Amplify.configure(amplifyConfig)
                }
                catch {
                }
            } else {
                // Handle error loading or decoding configuration
            }
        }
        else {
        }
        
        DocumentReaderService.shared.initializeDatabaseAndAPI(status: { statusValue, errorValue in
            var progressValue = ""
            var status = ""
            var validationError = ""
            completion(statusValue, errorValue)

        })
    }
    
    
    
    
    
    
    public static func initializationww(completion: @escaping (String, String, String) -> Void) {
        
        var currentLanguage = "en"
        if let preferredLanguageCode = Locale.preferredLanguages.first {
             currentLanguage = Locale(identifier: preferredLanguageCode).languageCode ?? "en"
            print("Device's preferred language code: \(currentLanguage)")
          
        } else {
            print("Unable to determine the device's preferred language code.")
        }
        iPassSDKDataManager.shared.deviceCurrentLangauge = currentLanguage
        
        do {
           // Amplify.Logging.logLevel = .verbose
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            
            
           // try Amplify.configure()
        } catch {
        }
        
        // Custom path to your configuration file
       
        
        let configFileName = "amplifyconfiguration.json"

        if let configFileURL = Bundle.module.url(forResource: configFileName, withExtension: nil) {
            let configFilePath = configFileURL.path
            if let amplifyConfig = loadAmplifyConfiguration(from: configFilePath) {
                // Configure Amplify with the loaded configuration
                do {
                    try Amplify.configure(amplifyConfig)
                }
                catch {
                }
            } else {
                // Handle error loading or decoding configuration
            }
        }
        else {
        }
        
        DocumentReaderService.shared.initializeDatabaseAndAPI(progress: { state in
            var progressValue = ""
            var status = ""
            var validationError = ""
            switch state {
            case .downloadingDatabase(progress: let progress):
                let progressString = String(format: "%.1f", progress * 100)
                progressValue = "\(progressString)%"
            case .initializingAPI:
                status = "Start Now"
            case .completed:
                break
            case .error(let text):
                validationError = text
            }
            completion(progressValue, status, validationError)
        })
    }
    
    
    public static  func loadAmplifyConfiguration(from path: String) -> AmplifyConfiguration? {
        // Read configuration data from the custom path
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return nil
        }

        // Decode the configuration data into an AmplifyConfiguration object
        do {
            let configuration = try JSONDecoder().decode(AmplifyConfiguration.self, from: data)
            return configuration
        } catch {
            return nil
        }
    }


    
    
}
