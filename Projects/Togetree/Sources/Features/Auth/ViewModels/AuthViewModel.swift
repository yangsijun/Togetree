//
//  AuthViewModel.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import SwiftUI
import AuthenticationServices
import Foundation

@MainActor
@Observable class AuthViewModel {
    var isSignedIn: Bool = false
    var currentUser: User?
    var errorMessage: String?
    
//    private let service: AuthService = AuthService()
    private let service: MockAuthService = MockAuthService()
    
    // TODO: Implement Handle Apple Login
    
    init() {
        MockUserService.loadMockUsersFromCSV(filename: "MockUsers")
        currentUser = mockUserList.first
    }
    
    
    func checkSignInStatus() {
        self.isSignedIn = true
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
    }
}
