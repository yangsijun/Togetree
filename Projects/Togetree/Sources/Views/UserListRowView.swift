//
//  UserListRowView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct UserListRowView: View {
    var user: User
    
    var body: some View {
        NavigationLink(destination: Text("Hello, World!")) {
            HStack {
                UserProfileView(user: user, imageSize: 52, showUsername: false)
                VStack(alignment: .leading) {
                    Text(user.name)
                    Text(user.statusMessage ?? "")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                }
            }
        }
    }
}

struct UserListRowView_Previews: PreviewProvider {
    static var user: User = User(
        name: "Air",
        profileImageUrl: "https://picsum.photos/200/300",
        statusMessage: "Hello, World!"
    )
    
    static var previews: some View {
        UserListRowView(user: user)
    }
}
