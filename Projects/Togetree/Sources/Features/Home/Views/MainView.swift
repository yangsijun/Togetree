//
//  MainView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct MainView: View {
    @Environment(AuthViewModel.self) var authViewModel
    @Environment(UserViewModel.self) var myUserViewModel
    @Bindable var userViewModel = UserViewModel()
    @State var goalViewModel = GoalViewModel()
    @State var focusedUser: User?
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    if userViewModel.user != nil {
                        FollowingHorizontalListView(myUser: myUserViewModel.user!, userList: myUserViewModel.followings, focusedUser: $focusedUser)
                        UserProfileInfoView(user: userViewModel.user!, followers: userViewModel.followers, followings: userViewModel.followings)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        GoalListView(user: userViewModel.user!, goalViewModel: goalViewModel)
                    }
                }
            }
            .background(Color.secondaryBackground)
            .navigationTitle(Text("Togetree"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {
                        focusedUser = myUserViewModel.user
                        showModal = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showModal) {
                        NavigationStack {
                            NewGoalView(
                                goalViewModel: goalViewModel,
                                showModal: $showModal
                            )
                        }
                    }
                }
            }
            // TODO: Implement Search feature
            .searchable(text: .constant(""))
        }
        .tint(Color.tintColor)
        .task {
            do {
                try await myUserViewModel.loadUser(with: authViewModel.currentUser!.id)
                focusedUser = myUserViewModel.user
            } catch {
                print(error.localizedDescription)
            }
        }
        .onChange(of: focusedUser) {
            Task {
                do {
                    try await userViewModel.loadUser(with: focusedUser!.id)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    @State static var authViewModel = AuthViewModel()
    @State static var myUserViewModel = UserViewModel()
    
    static var previews: some View {
        MainView()
            .environment(authViewModel)
            .environment(myUserViewModel)
    }
}
