//
//  UserProfileView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct UserProfileView: View {
    var user: User
    var imageSize: Int
    var showUsername: Bool = true
    
    var body: some View {
        Group {
            VStack {
                AsyncImage(url: URL(string: user.profileImageUrl ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: CGFloat(imageSize), height: CGFloat(imageSize))
                .clipShape(Circle())
                Group {
                    if showUsername {
                        Text(user.name)
                    }
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            UserProfileView(
                user: .init(name: "Test User", profileImageUrl: "https://picsum.photos/200/300"),
                imageSize: 100
            )
            UserProfileView(
                user: .init(name: "Test User", profileImageUrl: "https://picsum.photos/200/300"),
                imageSize: 64,
                showUsername: false
            )
        }
    }
}
