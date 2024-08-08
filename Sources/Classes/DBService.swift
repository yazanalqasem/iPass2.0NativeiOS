//
//  DBService.swift
//  IpassFrameWork1
//
//  Created by Mobile on 10/04/24.
//

import Foundation
import DocumentReader

final class DocumentReaderService {
    let kiPassLicenseFile = "iPass.license"
    //let kiPassDatabaseId = "Full"
   // let kiPassDatabaseId = "Full_authOther"
    let kiPassDatabaseId = "JOR_AllPassports"
    
//    "id": "JOR_AllPassports"
//    "id": "JOR_AllPassports_authOther"
//    
    enum State {
        case downloadingDatabase(progress: Double)
        case initializingAPI
        case completed
        case error(String)
    }

    static let shared = DocumentReaderService()
    private init() { }

    func deinitializeAPI() {
        DocReader.shared.deinitializeReader()
    }

    
    
    
    func initializeDatabaseAndAPI(status: @escaping (String, String) -> Void) {
        
            guard let licensePath = Bundle.module.url(forResource: "iPass", withExtension: "license") else {
                status("", "Missing License File in Framework Bundle")
            return
        }
        
    
                guard let licenseData = try? Data(contentsOf: licensePath) else {
                    status("", "Missing License File in Framework Bundle")
                    return
                }

        
        DispatchQueue.global().async {
            
            let config = DocReader.Config(license: licenseData)
            
            config.databasePath = Bundle.module.path(forResource: "db.dat", ofType: nil)
            
            DocReader.shared.initializeReader(config: config, completion: { (success, error) in
                DispatchQueue.main.async {
                    status("Processing Started", "")
                    if success {
                        status("Start Now", "")
                    } else {
                        status("", error?.localizedDescription ?? "Error")
                        
                    }
                }
            })
            

            
           
        }
        
    }
    
    
    
    
    
//
//    func initializeDatabaseAndAPI(progress: @escaping (State) -> Void) {
//        
//        
//        
//        
//      //  guard let licensePath = Bundle(for: type(of: self)).path(forResource: kiPassLicenseFile, ofType: nil) else {
//        
//      //  if let url = Bundle.module.url(forResource: "LICENSE", withExtension: "txt"),
//
//            
//            guard let licensePath = Bundle.module.url(forResource: "iPass", withExtension: "license") else {
//            progress(.error("Missing License File in Framework Bundle"))
//            return
//        }
//        
//       // guard let dddd = try? Data(contentsOf: licensePath)
//        
////        guard let licenseData = try? Data(contentsOf: URL(fileURLWithPath: licensePath.absoluteString)) else {
////            progress(.error("Unable to read License File"))
////            return
////        }
//
//                
//                guard let licenseData = try? Data(contentsOf: licensePath) else {
//                    progress(.error("Unable to read License File"))
//                    return
//                }
//
//        
//        DispatchQueue.global().async {
//            
//            var  currentDatabaseKey = ""
//            
//            
//            if let databasekey: String? = IpassUserDefaultsManager.shared.getValue(forKey: "databaseidkey") {
//                currentDatabaseKey = databasekey ?? ""
//            }
//            
//          
//            
//            if(currentDatabaseKey == self.kiPassDatabaseId) {
//                DocReader.shared.runAutoUpdate(
//                    databaseID: self.kiPassDatabaseId,
//                    progressHandler: { (inprogress) in
//                        progress(.downloadingDatabase(progress: inprogress.fractionCompleted))
//                    },
//                    completion: { (success, error) in
//                        if let error = error, !success {
//                            progress(.error("Database error: \(error.localizedDescription)"))
//                            return
//                        }
//                        let config = DocReader.Config(license: licenseData)
//                        DocReader.shared.initializeReader(config: config, completion: { (success, error) in
//                            DispatchQueue.main.async {
//                                progress(.initializingAPI)
//                                if success {
//                                    IpassUserDefaultsManager.shared.save(value: self.kiPassDatabaseId, forKey: "databaseidkey")
//                                    progress(.completed)
//                                } else {
//                                    progress(.error("Initialization error: \(error?.localizedDescription ?? "nil")"))
//                                    
//                                }
//                            }
//                        })
//                    }
//                )
//            }
//            else {
//                
//                DocReader.shared.removeDatabase { (success, error) in
//                        DocReader.shared.runAutoUpdate(
//                            databaseID: self.kiPassDatabaseId,
//                            progressHandler: { (inprogress) in
//                                progress(.downloadingDatabase(progress: inprogress.fractionCompleted))
//                            },
//                            completion: { (success, error) in
//                                if let error = error, !success {
//                                    progress(.error("Database error: \(error.localizedDescription)"))
//                                    return
//                                }
//                                let config = DocReader.Config(license: licenseData)
//                                DocReader.shared.initializeReader(config: config, completion: { (success, error) in
//                                    DispatchQueue.main.async {
//                                        progress(.initializingAPI)
//                                        if success {
//                                            IpassUserDefaultsManager.shared.save(value: self.kiPassDatabaseId, forKey: "databaseidkey")
//                                            progress(.completed)
//                                        } else {
//                                            progress(.error("Initialization error: \(error?.localizedDescription ?? "nil")"))
//                                            
//                                        }
//                                    }
//                                })
//                            }
//                        )
//                   
//                }
//                
//            }
//
//            
//           
//        }
//        
//    }
    
    
}

