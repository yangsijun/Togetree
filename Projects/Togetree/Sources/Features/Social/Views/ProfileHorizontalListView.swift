//
//  HorizontalProfileListView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct ProfileHorizontalListView: View {
    var userList: [User]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(userList) { user in
                    UserProfileView(user: user, imageSize: 64)
                }
                Button(action: {
                    // TODO: Navigate to FollowAndFollowerView
                }) {
                    Image(systemName: "chevron.forward.circle")
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
    }
}

struct ProfileHorizontalListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHorizontalListView(
            userList: [
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
            ]
        )
    }
}
