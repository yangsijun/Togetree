//
//  UserDetailView.swift
//  Togetree
//
//  Created by 양시준 on 4/20/25.
//

import SwiftUI

enum FollowListState {
    case followers
    case followings
}

struct UserProfileDetailView: View {
    @Environment(UserViewModel.self) var myUserViewModel
    @State var userViewModel = UserViewModel()
    
    var user: User
    @State var isFollowing: Bool = false
    @State var isButtonClicked: Bool = false
    
    @State var listState: FollowListState = .followers
    
    var body: some View {
        VStack {
            HStack {
                UserRowView(user: user, imageSize: 64)
                Spacer()
                FollowButtonView(isFollowing: isFollowing, isButtonClicked: $isButtonClicked)
            }
            .padding(.horizontal, 20)
            HStack {
                Button(action: { listState = .followers }) {
                    VStack {
                        Text("\(userViewModel.followers.count) Followers")
                            .frame(maxWidth: .infinity)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(listState == .followers ? Color.secondaryAccentColor : Color.clear)
                    }
                }
                Button(action: { listState = .followings }) {
                    VStack {
                        Text("\(userViewModel.followings.count) Following")
                            .frame(maxWidth: .infinity)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(listState == .followings ? Color.secondaryAccentColor : Color.clear)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .tint(Color.label)
            List {
                switch(listState) {
                case .followers:
                    FollowUserListView(userList: userViewModel.followers)
                case .followings:
                    FollowUserListView(userList: userViewModel.followings)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                do {
                    try await userViewModel.loadUser(with: user.id)
                    isFollowing = myUserViewModel.isFollowing(user)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .onChange(of: isButtonClicked) {
            Task {
                do {
                    isFollowing.toggle()
                    if isFollowing {
                        try await myUserViewModel.createFollow(to: user)
                        try await userViewModel.loadFollowers()
                        print("followed")
                    } else {
                        try await myUserViewModel.deleteFollow(to: user)
                        try await userViewModel.loadFollowers()
                        print("unfollowed")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .tint(Color.primary)
    }
}

struct UserProfileDetailView_Previews: PreviewProvider {
    @State static var myUserViewModel = UserViewModel()
    static var myUser = mockUserList[0]
    static var user = mockUserList[1]
    
    static var previews: some View {
        NavigationStack {
            UserProfileDetailView(user: user)
                .environment(myUserViewModel)
                .task {
                    do {
                        try await myUserViewModel.loadUser(with: myUser.id)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
        .tint(Color.primary)
    }
}
