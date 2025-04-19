//
//  HorizontalProfileListView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct ProfileHorizontalListView: View {
    @Binding var selectedUser: User?
    var spacing: CGFloat = 8
    
    var followings: [User] = mockUserList
    var followers: [User] = mockUserList
        
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: spacing) {
                ForEach(followings) { user in
                    Button(action: {
                        selectedUser = user
                        print(user.name)
                    }) {
                        UserProfileView(user: user, imageSize: 64, isSelected: selectedUser!.id == user.id)
                    }
                    .tint(Color.label)
                }
                Button(action: {
                    // TODO: Navigate to FollowAndFollowerView
                }) {
                    Image(systemName: "chevron.forward.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 8)
                .tint(Color.secondaryAccentColor)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
    }
}

struct ProfileHorizontalListView_Previews: PreviewProvider {
    @State static var selectedUser: User? = mockUserList[0]
    
    static var previews: some View {
        ProfileHorizontalListView(selectedUser: $selectedUser, spacing: 12)
    }
}
