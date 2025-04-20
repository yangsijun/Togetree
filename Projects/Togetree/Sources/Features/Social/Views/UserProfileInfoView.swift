//
//  UserProfileInfoView.swift
//  Togetree
//
//  Created by 양시준 on 4/20/25.
//

import SwiftUI

struct UserProfileInfoView: View {
    var user: User
    var followers: [User] = []
    var followings: [User] = []
    
    var body: some View {
        HStack(spacing: 8) {
            UserProfileImageView(user: user, imageSize: 64)
            VStack(alignment: .leading) {
                Text(user.name)
                Text(user.statusMessage ?? "")
                    .font(.caption)
                    .foregroundStyle(Color.secondaryLabel)
            }
            Spacer()
            NavigationLink(destination: Text("Hello, World!")) {
                VStack {
                    Text("Followers")
                        .font(.caption)
                    Text("\(followers.count)")
                }
                .padding(8)
            }
            .tint(Color.label)
            NavigationLink(destination: Text("Hello, World!")) {
                VStack {
                    Text("Followings")
                        .font(.caption)
                    Text("\(followers.count)")
                }
                .padding(8)
            }
            .tint(Color.label)
        }
    }
}

struct UserProfileInfoView_Previews: PreviewProvider {
    static var user = mockUserList[0]
    static var followers: [User] = Array(mockUserList[1...])
    static var followings: [User] = Array(mockUserList[1...])
    
    static var previews: some View {
        NavigationStack {
            UserProfileInfoView(user: user, followers: followers, followings: followings)
        }
    }
}
