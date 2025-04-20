//
//  Auth.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation

struct AppleLoginRequest: Codable {
    let userID: String
    let email: String?
    let name: String?
}

struct LoginResponse: Codable {
    let token: String
    let user: User
}
