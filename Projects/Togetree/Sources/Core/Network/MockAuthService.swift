//
//  MockAuthService.swift
//  Togetree
//
//  Created by 양시준 on 4/21/25.
//

import Foundation
import AuthenticationServices

class MockAuthService: AuthService {
//    // TODO: API URL
//    let baseURL = URL(string: "")!
    
    func loginWithApple(userID: String, email: String?, name: String?) async throws -> LoginResponse {
        return LoginResponse(
            token: "mock-token",
            user: mockUserList[0]
        )
    }
    
    func checkSignInStatus() -> Bool {
        return true
    }
}
