//
//  RootView.swift
//  Togetree
//
//  Created by 양시준 on 4/21/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        Group {
            if authViewModel.isSignedIn {
                MainView()
            } else {
                SignInView()
            }
        }
        .onAppear {
            authViewModel.checkSignInStatus()
        }
    }
}
