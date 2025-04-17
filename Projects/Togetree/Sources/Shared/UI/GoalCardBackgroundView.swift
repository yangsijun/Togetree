//
//  GoalCardBackgroundView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

struct GoalCardBackgroundView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.tertiaryBackground)
    }
}

#Preview {
    GoalCardBackgroundView()
        .frame(width: 300, height: 150)
}
