//
//  File.swift
//  
//
//  Created by MOBILE on 31/07/24.
//

import Foundation

class IpassUserDefaultsManager {
    static let shared = IpassUserDefaultsManager()
    private let defaults = UserDefaults.standard
    
    private init() { }
    
    // MARK: - Save Data
    
    func save<T>(value: T, forKey key: String) {
        defaults.set(value, forKey: key)
    }
    
    func save<T: Encodable>(object: T, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(object) {
            defaults.set(encoded, forKey: key)
        }
    }
    
    // MARK: - Retrieve Data
    
    func getValue<T>(forKey key: String) -> T? {
        return defaults.value(forKey: key) as? T
    }
    
    func getObject<T: Decodable>(forKey key: String, type: T.Type) -> T? {
        if let data = defaults.data(forKey: key),
           let object = try? JSONDecoder().decode(type, from: data) {
            return object
        }
        return nil
    }
    
    // MARK: - Remove Data
    
    func removeValue(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
