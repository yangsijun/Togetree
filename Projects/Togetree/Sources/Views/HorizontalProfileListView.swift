//
//  HorizontalProfileListView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct HorizontalProfileListView: View {
    var userList: [User]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(userList, id: \.id) { user in
                    UserProfileView(user: user, imageSize: 64)
                }
                Button(action: {
                    // TODO: Navigate to FollowAndFollowerView
                }) {
                    Image(systemName: "chevron.forward.circle")
                }
                .padding(.horizontal, 8)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
    }
}

struct HorizontalProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProfileListView(
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
