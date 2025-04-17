//
//  GoalCardBackgroundView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

public struct GoalCardBackgroundView: View {
    public var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color("TertiaryBackground"))
    }
}

#Preview {
    GoalCardBackgroundView()
        .frame(width: 300, height: 150)
}
