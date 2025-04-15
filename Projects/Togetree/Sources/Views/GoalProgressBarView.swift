//
//  GoalProgressBarView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

public struct GoalProgressBarView: View {
    var currentProgress: Int
    var endProgress: Int
    var goalLabel: String? = nil
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(currentProgress) / \(endProgress) \(goalLabel ?? "")")
            ProgressView(value: Double(currentProgress) / Double(endProgress))
                .tint(Color("AccentColor"))
        }
        .padding(.top, 10)
    }
}

struct GoalProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        GoalProgressBarView(currentProgress: 4, endProgress: 5)
    }
}
