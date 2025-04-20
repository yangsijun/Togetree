//
//  UserListRowView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct UserRowView: View {
    var user: User
    var imageSize: CGFloat
    
    var body: some View {
        HStack(spacing: 8) {
            UserProfileImageView(user: user, imageSize: imageSize)
            VStack(alignment: .leading) {
                Text(user.name)
                    .foregroundStyle(Color.label)
                Text(user.statusMessage ?? "")
                    .font(.caption)
                    .foregroundStyle(Color.secondaryLabel)
            }
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var user: User = User(
        name: "Air",
        profileImageUrl: "https://picsum.photos/200/300",
        statusMessage: "Hello, World!"
    )
    
    static var previews: some View {
        NavigationStack {
            UserRowView(user: user, imageSize: 52)
        }
    }
}
