//
//  GoalTitleCardTextView.swift
//  Togetree
//
//  Created by 양시준 on 4/16/25.
//

import SwiftUI

struct GoalTitleCardTextView: View {
    var title: String
    var description: String?
    
    public var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
            Group {
                if description != nil {
                    Text(description ?? "")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    VStack {
        GoalTitleCardTextView(
            title: "앱 배포하기",
            description: "Togetree 앱 배포하기"
        )
        .padding(.horizontal, 20)
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity)
        .background(.gray)
        
        GoalTitleCardTextView(
            title: "앱 배포하기"
        )
        .padding(.horizontal, 20)
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity)
        .background(.gray)
    }
}
