//
//  GoalTreesView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct GoalTreesView: View {
    var userList: [User] = []
    
    var body: some View {
        List {
            ForEach(userList) { user in
                UserListRowView(user: user)
            }
        }
        .listStyle(.plain)
        
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
