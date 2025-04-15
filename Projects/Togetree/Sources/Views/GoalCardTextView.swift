//
//  GoalCardTextView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

public struct GoalCardTextView: View {
    var title: String
    var description: String?
    var isPublic: Bool
    
    public var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description ?? "")
                    .font(.caption)
                    .foregroundStyle(Color(uiColor: .secondaryLabel))
            }
            Spacer()
            Group {
                if isPublic {
                    Image(systemName: "globe")
                } else {
                    Image(systemName: "lock")
                }
            }
            .foregroundStyle(Color(uiColor: .secondaryLabel))
            .frame(width: 20, height: 20)
        }
    }
}

struct GoalCardTextView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCardTextView(
            title: "앱 배포하기",
            description: "Togetree 앱 배포하기",
            isPublic: true
        )
    }
}
