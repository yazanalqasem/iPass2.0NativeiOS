//
//  File.swift
//  
//
//  Created by MOBILE on 23/05/24.
//


import Foundation

struct Apis {
    static let baseUrl = "https://plusapi.ipass-mena.com/api/v1/ipass/"
}

// MARK: - FORM
// Social Register Api
struct UserLoginApi {
    static let baseApi = (Apis.baseUrl) + "create/authenticate/login"
    static let email = "email"
    static let password = "password"
}

