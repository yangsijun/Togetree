//
//  AuthService.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation

class AuthService {
    // TODO: API URL
//    let baseURL = URL(string: "")!
    
//    func loginWithApple(userID: String, email: String?, name: String?) async throws -> LoginResponse {
//        let url = baseURL.appendingPathComponent("/auth/apple-login")
//        let request = AppleLoginRequest(userID: userID, email: email, name: name)
//        return try await APIClient.post(url, body: request)
//    }
    
//    func checkSignInStatus() {
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        let userID = UserDefaults.standard.string(forKey: "appleUserID") ?? ""
//
//        guard !userID.isEmpty else {
//            self.isSignedIn = false
//            return
//        }
//
//        appleIDProvider.getCredentialState(forUserID: userID) { (credentialState, error) in
//            DispatchQueue.main.async {
//                switch credentialState {
//                case .authorized:
//                    self.isSignedIn = true
//                case .revoked, .notFound:
//                    self.isSignedIn = false
//                default:
//                    self.isSignedIn = false
//                }
//            }
//        }
//    }
}
