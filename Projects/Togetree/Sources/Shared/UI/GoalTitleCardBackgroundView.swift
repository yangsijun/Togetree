//
//  GoalTitleCardBackgroundView.swift
//  Togetree
//
//  Created by 양시준 on 4/16/25.
//

import SwiftUI

struct GoalTitleCardBackgroundView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color("AccentColor"))
    }
}

#Preview {
    GoalTitleCardBackgroundView()
        .frame(width: 300, height: 150)
}
