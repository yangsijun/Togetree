//
//  RootView.swift
//  Togetree
//
//  Created by 양시준 on 4/21/25.
//

import SwiftUI

struct RootView: View {
    @Environment(AuthViewModel.self) var authViewModel
    @State var myUserViewModel = UserViewModel()

    var body: some View {
        Group {
            if authViewModel.isSignedIn {
                MainView()
                    .environment(myUserViewModel)
            } else {
                SignInView()
            }
        }
        .onAppear {
            authViewModel.checkSignInStatus()
        }
    }
}
