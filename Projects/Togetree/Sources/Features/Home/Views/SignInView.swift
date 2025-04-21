//
//  LoginView.swift
//  Togetree
//
//  Created by 양시준 on 4/21/25.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    @Environment(AuthViewModel.self) var authViewModel
    
    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: configure,
            onCompletion: handle
        )
        .signInWithAppleButtonStyle(.black) // or .white, .whiteOutline
        .frame(height: 45)
        .padding()
    }
    
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    func handle(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authResults):
            if let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential {
                let userId = appleIDCredential.user
                let email = appleIDCredential.email
                let fullName = appleIDCredential.fullName
                // Save userId for later login
                print("User ID: \(userId)")
                print("Email: \(email ?? "")")
                print("Full Name: \(fullName?.givenName ?? "")")
            }
        case .failure(let error):
            print("Authorization failed: \(error.localizedDescription)")
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    @State static var authViewModel = AuthViewModel()
    static var previews: some View {
        SignInView()
            .environment(authViewModel)
    }
}
