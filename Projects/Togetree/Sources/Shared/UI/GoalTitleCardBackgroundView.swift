//
//  GoalTitleCardBackgroundView.swift
//  Togetree
//
//  Created by 양시준 on 4/16/25.
//

import SwiftUI

public struct GoalTitleCardBackgroundView: View {
    public var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color("AccentColor"))
    }
}

#Preview {
    GoalTitleCardBackgroundView()
        .frame(width: 300, height: 150)
}
