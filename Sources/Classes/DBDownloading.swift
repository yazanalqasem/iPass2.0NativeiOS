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
    
    
    public static func testDBIssue() {
        DocReader.shared.runAutoUpdate(databaseID: "Full", progressHandler: { (progress) in
            let progressString111 = String(format: "%.1f", progress.fractionCompleted * 100)
            print(progressString111) // progress block
        }, completion: { (success, error) in
            if success {
                print(success) // Success state
            } else {
                print(error) // Error status
            }
        })
    }
    
    
    public static func initialization(completion: @escaping (String, String, String) -> Void) {
        
        print("print1111")
        do {
           // Amplify.Logging.logLevel = .verbose
            print("print2222")
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            
            
           // try Amplify.configure()
        } catch {
            print("print3333")
        }
        
        // Custom path to your configuration file
       
        print("print4444")
        
        let configFileName = "amplifyconfiguration.json"

        if let configFileURL = Bundle.module.url(forResource: configFileName, withExtension: nil) {
            let configFilePath = configFileURL.path
            if let amplifyConfig = loadAmplifyConfiguration(from: configFilePath) {
                // Configure Amplify with the loaded configuration
                do {
                    print("print5555")
                    try Amplify.configure(amplifyConfig)
                    print("print6666")
                }
                catch {
                    print("print7777")
                }
            } else {
                print("print8888")
                // Handle error loading or decoding configuration
            }
        }
        else {
            print("print9999")
        }
        
        print("printAAAA")
        DocumentReaderService.shared.initializeDatabaseAndAPI(progress: { state in
            var progressValue = ""
            var status = ""
            var validationError = ""
            switch state {
            case .downloadingDatabase(progress: let progress):
                let progressString = String(format: "%.1f", progress * 100)
                progressValue = "Downloading database: \(progressString)%"
                print("printBBBB")
            case .initializingAPI:
                status = "Start Now"
                print("printCCCC")
            case .completed:
                break
            case .error(let text):
                validationError = text
            }
            print("printDDDD")
            completion(progressValue, status, validationError)
        })
        print("printEEEE")
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
