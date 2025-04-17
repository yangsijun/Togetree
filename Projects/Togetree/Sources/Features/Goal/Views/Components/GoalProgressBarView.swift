//
//  GoalProgressBarView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

public struct GoalProgressBarView: View {
    @Binding var currentProgress: Int
    var endProgress: Int
    var goalLabel: String? = nil
    var withStepper: Bool = false
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(currentProgress) / \(endProgress) \(goalLabel ?? "")")
                    .padding(.top, 10)
                Spacer()
                Group {
                    if withStepper {
                        Stepper(value: $currentProgress, in: 0...endProgress, step: 1) {}
                    }
                }
            }
            ProgressView(value: Double(currentProgress) / Double(endProgress))
                .tint(Color("AccentColor"))
        }
    }
}

struct GoalProgressBar_Previews: PreviewProvider {
    @State static var currentProgress = 4
    static var endProgress = 5
    static var goalLabel: String? = "번"
    static var withStepper: Bool = true
    
    static var previews: some View {
        VStack {
            GoalProgressBarView(
                currentProgress: $currentProgress,
                endProgress: 5,
                goalLabel: goalLabel
            )
            GoalProgressBarView(
                currentProgress: $currentProgress,
                endProgress: 5,
                goalLabel: goalLabel,
                withStepper: true
            )
        }
    }
}
