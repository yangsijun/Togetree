//
//  FollowButtonView.swift
//  Togetree
//
//  Created by 양시준 on 4/20/25.
//

import SwiftUI

struct FollowButtonView: View {
    var isFollowing: Bool
    @Binding var isButtonClicked: Bool
    
    public var body: some View {
        if isFollowing {
            Button(action: {
                isButtonClicked.toggle()
            }) {
                Text("Following")
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .tint(Color.secondaryAccentColor)
        } else {
            Button(action: {
                isButtonClicked.toggle()
            }) {
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
            FollowButtonView(isFollowing: true, isButtonClicked: .constant(false))
            FollowButtonView(isFollowing: false, isButtonClicked: .constant(false))
        }
    }
}
