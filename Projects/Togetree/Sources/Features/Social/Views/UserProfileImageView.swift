//
//  UserProfileView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct UserProfileImageView: View {
    var user: User
    var imageSize: Int
    
    var body: some View {
        Group {
            VStack {
                AsyncImage(url: URL(string: user.profileImageUrl ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: CGFloat(imageSize), height: CGFloat(imageSize))
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: CGFloat(imageSize), height: CGFloat(imageSize))
                        }
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
            }
        }
    }
}

struct UserProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            UserProfileImageView(
                user: .init(name: "Test User", profileImageUrl: "https://picsum.photos/200/300"),
                imageSize: 100
            )
            UserProfileImageView(
                user: .init(name: "Test User", profileImageUrl: "https://picsum.photos/200/300"),
                imageSize: 64
            )
            UserProfileImageView(
                user: .init(name: "Test User", profileImageUrl: "https://picsum.photos/200/300"),
                imageSize: 32
            )
        }
    }
}
