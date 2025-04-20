//
//  GoalTreesHorizontalListView.swift
//  Togetree
//
//  Created by 양시준 on 4/16/25.
//

import SwiftUI

struct GoalTreesHorizontalListView: View {
    var title: String
    @Binding var userList: [User]
    private let visibleProfileCount: Int = 8
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NavigationLink(destination: GoalTreesView(title: title, userList: userList)) {
                HStack {
                    Text(title)
                    Text(userList.count.description)
                        .font(.caption)
                        .foregroundStyle(Color.secondaryAccentColor)
                    Image(systemName: "chevron.forward")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondaryAccentColor)
                }
            }
            .buttonStyle(.plain)
            ScrollView(.horizontal) {
                HStack(spacing: 6) {
                    ForEach(userList.suffix(visibleProfileCount)) { user in
                        UserProfileImageView(user: user, imageSize: 32)
                    }
                    Group {
                        if userList.count <= visibleProfileCount {
                            Spacer()
                        } else {
                            Text("+\(userList.count - visibleProfileCount)")
                                .font(.caption)
                                .foregroundStyle(Color.secondaryAccentColor)
                        }
                    }
                }
            }
        }
    }
}

struct GoalTreesHorizontalListView_Previews: PreviewProvider {
    static var title: String = "응원나무"
    @State static var userList: [User] = [
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
    ]
    
    static var previews: some View {
        NavigationStack {
            GoalTreesHorizontalListView(
                title: title,
                userList: $userList
            )
        }
        .tint(Color.tintColor)
    }
}
