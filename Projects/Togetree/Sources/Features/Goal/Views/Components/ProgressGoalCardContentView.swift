//
//  ProgressGoalCardView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

struct ProgressGoalCardContentView: View {
    @Binding var goal: ProgressGoal
    var isMyGoal: Bool
    
    var body: some View {
        GoalProgressBarView(
            currentProgress: $goal.currentProgress,
            endProgress: goal.endProgress,
            goalLabel: goal.goalLabel,
            withStepper: isMyGoal ? true : false
        )
        .animation(.easeInOut, value: goal.currentProgress)
    }
}

struct ProgressGoalCardContentView_Previews: PreviewProvider {
    @State static var goal = ProgressGoal(
        userId: mockUserList[0].id,
        title: "러닝으로 건강한 몸과 마음 만들기",
        description: "4월 한 달 동안 3km 러닝 10번 하기",
        createdAt: Date(),
        updatedAt: Date(),
        startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!,
        isPublic: true,
        currentProgress: 4,
        endProgress: 10,
        goalLabel: "번"
    )
    
    static var previews: some View {
        NavigationStack {
            VStack {
                ProgressGoalCardContentView(goal: $goal, isMyGoal: true)
            }
        }
    }
}
