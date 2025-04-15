//
//  GoalProgressBarWithSteperView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

public struct GoalProgressBarWithStepperView: View {
    @Binding var currentProgress: Int
    var endProgress: Int
    var goalLabel: String? = nil
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(currentProgress) / \(endProgress) \(goalLabel ?? "")")
                Spacer()
                Stepper(value: $currentProgress, in: 0...endProgress, step: 1) {}
            }
            ProgressView(value: Double(currentProgress) / Double(endProgress))
                .tint(Color("AccentColor"))
        }
        .padding(.top, 10)
    }
}

struct GoalProgressBarWithStepperView_Previews: PreviewProvider {
    @State static var currentProgress = 4
    static var endProgress = 5
    static var goalLabel: String? = "번"
    
    static var previews: some View {
        GoalProgressBarWithStepperView(currentProgress: $currentProgress, endProgress: 5, goalLabel: goalLabel)
    }
}
