//
//  FollowingHorizontalListView.swift
//  Togetree
//
//  Created by 양시준 on 4/20/25.
//

import SwiftUI

struct FollowingHorizontalListView: View {
    var myUser: User
    var userList: [User]
    @Binding var focusedUser: User?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                FollowingHorziontalItemView(user: myUser, focusedUser: $focusedUser)
                ForEach(userList) { user in
                    FollowingHorziontalItemView(user: user, focusedUser: $focusedUser)
                }
                NavigationLink(destination: UserProfileDetailView(user: myUser, listState: .followings)) {
                    Image(systemName: "chevron.forward.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .foregroundStyle(Color.secondaryAccentColor)
                .padding(.horizontal, 8)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
    }
}

struct FollowingHorizontalListView_Previews: PreviewProvider {
    @State static var authViewModel = AuthViewModel()
    @State static var myUserViewModel = UserViewModel()
    @State static var userViewModel = UserViewModel()
    
    static var previews: some View {
        FollowingHorizontalListView(myUser: mockUserList[0], userList: myUserViewModel.followings, focusedUser: $userViewModel.user)
            .onAppear {
                Task {
                    do {
                        try await myUserViewModel.loadUser(with: authViewModel.currentUser!.id)
                        try await userViewModel.loadUser(with: authViewModel.currentUser!.id)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
    }
}
