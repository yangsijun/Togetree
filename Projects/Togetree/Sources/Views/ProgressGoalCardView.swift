//
//  ProgressGoalCardView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

public struct ProgressGoalCardView: View {
    @Binding var goal: ProgressGoal
    var showTextView: Bool = true
    
    public var body: some View {
        NavigationLink {
            ProgressGoalDetailView(goal: $goal)
        } label: {
            VStack(spacing: 16) {
                Group {
                    if showTextView {
                        GoalCardTextView(title: goal.title, description: goal.description, isPublic: goal.isPublic)
                    }
                }
                GoalProgressBarWithStepperView(
                    currentProgress: $goal.currentProgress,
                    endProgress: goal.endProgress,
                    goalLabel: goal.goalLabel
                )
            }
            .padding(20)
            .background(
                GoalCardBackgroundView()
            )
        }
        .buttonStyle(.plain)
    }
}

struct ProgressGoalCardView_Previews: PreviewProvider {
    @State static var goal = ProgressGoal(
        title: "러닝으로 건강한 몸과 마음 만들기",
        description: "4월 한 달 동안 3km 러닝 10번 하기",
        createdAt: Date(),
        updatedAt: Date(),
        startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!,
        isPublic: true,
        currentProgress: 4,
        endProgress: 10
    )
    
    static var previews: some View {
        NavigationStack {
            VStack {
                ProgressGoalCardView(goal: $goal)
                ProgressGoalCardView(goal: $goal, showTextView: false)
            }
        }
    }
}
