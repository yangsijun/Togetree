//
//  FollowingHorziontalItemView.swift
//  Togetree
//
//  Created by 양시준 on 4/20/25.
//

import SwiftUI

struct FollowingHorziontalItemView: View {
    @Binding var selectedUser: User?
    var user: User
    
    var body: some View {
        Button(action: {
            selectedUser = user
            print(user.name)
        }) {
            HStack {
                UserProfileImageView(
                    user: user,
                    imageSize: 36
                )
                Text(user.name)
                    .bold(selectedUser == user)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                selectedUser == user
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
    @State static var selectedUser: User? = mockUserList[0]
    static var user = mockUserList[0]
    
    static var previews: some View {
        HStack {
            FollowingHorziontalItemView(selectedUser: $selectedUser, user: user)
            FollowingHorziontalItemView(selectedUser: $selectedUser, user: mockUserList[1])
        }
    }
}
