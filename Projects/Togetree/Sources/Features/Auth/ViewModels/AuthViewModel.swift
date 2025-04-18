//
//  AuthViewModel.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import AuthenticationServices
import Foundation

@MainActor
class AuthViewModel: ObservableObject {
//    @Published var isLoggedIn: Bool = false
//    @Published var currentUserId: UUID?
    
    @Published var isLoggedIn: Bool = true
    @Published var currentUserId: UUID? = mockUserList[0].id
    @Published var errorMessage: String?
    
    private let service: AuthService = AuthService()
    
//    func handleAppleSignIn(credential: ASAuthorizationAppleIDCredential) async {
//        let userIdentifier = credential.user
//        let email = credential.email ?? ""
//        let fullName = credential.fullName?.givenName ?? ""
//
//        // 서버에 Apple 사용자 ID 전달 → 로그인 or 회원가입 처리
//        do {
//            let response = try await service.loginWithApple(userID: userIdentifier, email: email, name: fullName)
//            saveToken(response.token)
//            currentUserId = response.userId
//            isLoggedIn = true
//        } catch {
//            errorMessage = "Apple Login Failed: \(error.localizedDescription)"
//        }
//    }

    private func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "auth_token")
    }
}
