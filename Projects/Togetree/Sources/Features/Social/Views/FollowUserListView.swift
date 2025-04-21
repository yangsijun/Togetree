//
//  FollowUserListView.swift
//  Togetree
//
//  Created by 양시준 on 4/21/25.
//

import SwiftUI

struct FollowUserListView: View {
    @Environment(UserViewModel.self) var myUserViewModel
    var userList: [User]
    
    var body: some View {
        ForEach(userList) { user in
            NavigationLink(
                destination: UserProfileDetailView(user: user)
                    .environment(myUserViewModel)
            ) {
                UserRowView(user: user, imageSize: 52)
            }
        }
    }
}

struct FollowUserListView_Previews: PreviewProvider {
    @State static var myUserViewModel = UserViewModel()
    static var myUser = mockUserList[0]
    static var userList: [User] = [
        mockUserList[0],
        mockUserList[1],
        mockUserList[2]
    ]
    
    static var previews: some View {
        NavigationStack {
            FollowUserListView(userList: userList)
                .environment(myUserViewModel)
                .task {
                    do {
                        try await myUserViewModel.loadUser(with: myUser.id)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
        .tint(.primary)
    }
}
