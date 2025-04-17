//
//  GoalTreesHorizontalListView.swift
//  Togetree
//
//  Created by 양시준 on 4/16/25.
//

import SwiftUI

public struct GoalTreesHorizontalListView: View {
    var title: String
    @Binding var userList: [User]
    private let visibleProfileCount: Int = 8
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NavigationLink(destination: GoalTreesView(userList: userList)) {
                HStack {
                    Text(title)
                    Text(userList.count.description)
                        .font(.caption)
                        .foregroundStyle(Color("SecondaryAccentColor"))
                    Image(systemName: "chevron.forward")
                        .font(.subheadline)
                        .foregroundStyle(Color("SecondaryAccentColor"))
                }
            }
            .buttonStyle(.plain)
            ScrollView(.horizontal) {
                HStack(spacing: 6) {
                    ForEach(userList.suffix(visibleProfileCount)) { user in
                        UserProfileView(user: user, imageSize: 32, showUsername: false)
                    }
                    Group {
                        if userList.count <= visibleProfileCount {
                            Spacer()
                        } else {
                            Text("+\(userList.count - visibleProfileCount)")
                                .font(.caption)
                                .foregroundStyle(Color("SecondaryAccentColor"))
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
    }
}
