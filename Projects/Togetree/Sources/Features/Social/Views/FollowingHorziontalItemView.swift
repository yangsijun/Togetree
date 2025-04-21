//
//  FollowingHorziontalItemView.swift
//  Togetree
//
//  Created by 양시준 on 4/20/25.
//

import SwiftUI

struct FollowingHorziontalItemView: View {
    var user: User
    @Binding var focusedUser: User?
    
    var body: some View {
        Button(action: {
            focusedUser = user
            print(user.name)
        }) {
            HStack {
                UserProfileImageView(
                    user: user,
                    imageSize: 36
                )
                Text(user.name)
                    .bold(focusedUser == user)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                focusedUser == user
                    ? RoundedRectangle(cornerRadius: 16)
                        .fill(Color.tertiaryBackground)
                        .stroke(Color.primary, lineWidth: 2)
                    : RoundedRectangle(cornerRadius: 16)
                        .fill(Color.clear)
                        .stroke(Color.secondaryLabel, lineWidth: 1)
            )
        }
        .tint(Color.label)
    }
}

struct FollowingHorziontalItemView_Previews: PreviewProvider {
    @State static var focusedUser: User? = mockUserList[0]
    
    static var previews: some View {
        HStack {
            FollowingHorziontalItemView(user: mockUserList[0], focusedUser: $focusedUser)
            FollowingHorziontalItemView(user: mockUserList[1], focusedUser: $focusedUser)
        }
    }
}
