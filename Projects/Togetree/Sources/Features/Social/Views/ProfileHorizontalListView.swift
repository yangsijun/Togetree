//
//  HorizontalProfileListView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct ProfileHorizontalListView: View {
    var followings: [User] = mockUserList
    var followers: [User] = mockUserList
    
    var userId: UUID
        
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(followings) { user in
                    UserProfileView(user: user, imageSize: 64)
                }
                Button(action: {
                    // TODO: Navigate to FollowAndFollowerView
                }) {
                    Image(systemName: "chevron.forward.circle")
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
    }
}

struct ProfileHorizontalListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHorizontalListView(userId: mockUserList[0].id)
    }
}
