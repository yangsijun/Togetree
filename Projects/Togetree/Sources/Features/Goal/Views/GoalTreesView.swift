//
//  GoalTreesView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct GoalTreesView: View {
    var title: String = ""
    var userList: [User] = []
    
    var body: some View {
        List {
            ForEach(userList) { user in
                // TODO: Link to OtherUserDetailView
                NavigationLink(destination: Text("Detail")) {
                    UserRowView(user: user, imageSize: 52)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GoalTreesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GoalTreesView(
                userList: [
                    User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
                    User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
                    User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
                    User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
                    User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
                    User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
                    User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
                    User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
                ]
            )
        }
    }
}
