//
//  FollowingHorizontalListView.swift
//  Togetree
//
//  Created by 양시준 on 4/20/25.
//

import SwiftUI

struct FollowingHorizontalListView: View {
    @Binding var selectedUser: User?
    var followings: [User]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(followings) { user in
                    FollowingHorziontalItemView(selectedUser: $selectedUser, user: user)
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

struct FollowingHorizontalListView_Previews: PreviewProvider {
    @State static var selectedUser: User? = mockUserList[0]
    static var followings: [User] = Array(mockUserList[1...])
    
    static var previews: some View {
        FollowingHorizontalListView(selectedUser: $selectedUser, followings: followings)
    }
}
