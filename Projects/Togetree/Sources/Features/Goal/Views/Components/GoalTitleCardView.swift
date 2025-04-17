//
//  GoalTitleCardView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

public struct GoalTitleCardView: View {
    var goal: Goal
    
    public var body: some View {
        GoalTitleCardTextView(title: goal.title, description: goal.description)
            .padding(.horizontal, 20)
            .padding(.vertical, 32)
            .frame(maxWidth: .infinity)
            .background(GoalTitleCardBackgroundView())
    }
}

struct GoalTitleCardView_Previews: PreviewProvider {
    static var goal: Goal = SingleGoalGoal(
        title: "앱 배포하기",
        description: "dfdsdfsdf",
        createdAt: Date(),
        updatedAt: Date(),
        startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!,
        isPublic: false,
        isCompleted: false
    )
    
    static var previews: some View {
        GoalTitleCardView(goal: goal)
    }
}
