//
//  FollowButtonView.swift
//  Togetree
//
//  Created by 양시준 on 4/20/25.
//

import SwiftUI

struct FollowButtonView: View {
    @Binding var isFollowing: Bool
    
    public var body: some View {
        if isFollowing {
            Button(action: { isFollowing.toggle() }) {
                Text("Following")
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .tint(Color.secondaryAccentColor)
        } else {
            Button(action: { isFollowing.toggle() }) {
                Text("Follow")
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(Color.secondaryAccentColor)
        }
    }
}

struct FollowButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FollowButtonView(isFollowing: .constant(true))
            FollowButtonView(isFollowing: .constant(false))
        }
    }
}
