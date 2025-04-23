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
    @State var userSearchViewModel = UserSearchViewModel()
    @State var goalViewModel = GoalViewModel()
    @State var focusedUser: User?
    @State var showModal: Bool = false
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            Group {
                if searchText.isEmpty {
                    ScrollView {
                        VStack(spacing: 8) {
                            if userViewModel.user != nil {
                                FollowingHorizontalListView(myUser: myUserViewModel.user!, userList: myUserViewModel.followings, focusedUser: $focusedUser)
                                UserProfileInfoView(user: userViewModel.user!, followers: userViewModel.followers, followings: userViewModel.followings)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                GoalListView(user: userViewModel.user!, goalViewModel: goalViewModel, isMyGoal: true)
                            }
                        }
                    }
                } else {
                    List(userSearchViewModel.userList) { user in
                        NavigationLink(destination: UserProfileDetailView(user: user)) {
                            UserRowView(user: user, imageSize: 52)
                        }
                    }
                    .listStyle(.plain)
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
        }
        .searchable(text: $searchText, prompt: "Search users")
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
        .onChange(of: searchText) {
            if searchText.isEmpty {
                userSearchViewModel.userList.removeAll()
            } else {
                Task {
                    do {
                        try await userSearchViewModel.searchUsers(by: searchText)
                    } catch {
                        print(error.localizedDescription)
                    }
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
