//
//  MainView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct MainView: View {
    var userList: [User] = []
    var goalList: [Goal] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                HorizontalProfileListView(userList: userList)
                // TODO: Goal List
                List {
                    Text("Goal List")
                    Text("Goal List")
                    Text("Goal List")
                }
            }
            .navigationTitle(Text("Togetree"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {
                        // TODO: New Goal
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            // TODO: Implement Search feature
            .searchable(text: .constant(""))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
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
