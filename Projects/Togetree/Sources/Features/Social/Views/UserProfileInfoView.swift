//
//  UserProfileInfoView.swift
//  Togetree
//
//  Created by 양시준 on 4/20/25.
//

import SwiftUI

struct UserProfileInfoView: View {
    var user: User
    var followers: [User]
    var followings: [User]
    
    var body: some View {
        HStack(spacing: 8) {
            NavigationLink(destination: UserProfileDetailView(user: user)) {
                UserRowView(user: user, imageSize: 64)
            }
            NavigationLink(destination: UserProfileDetailView(user: user, listState: .followers)) {
                VStack {
                    Text("Followers")
                        .font(.caption)
                    Text("\(followers.count)")
                }
                .padding(8)
            }
            .tint(Color.label)
            NavigationLink(destination: UserProfileDetailView(user: user, listState: .followings)) {
                VStack {
                    Text("Followings")
                        .font(.caption)
                    Text("\(followings.count)")
                }
                .padding(8)
            }
            .tint(Color.label)
        }
    }
}

struct UserProfileInfoView_Previews: PreviewProvider {
    static var user = mockUserList[0]
    static var followers: [User] = [
        mockUserList[1],
        mockUserList[2],
        mockUserList[3],
    ]
    static var followings: [User] = [
        mockUserList[1],
        mockUserList[2],
    ]
    
    static var previews: some View {
        NavigationStack {
            UserProfileInfoView(user: user, followers: followers, followings: followings)
        }
    }
}
