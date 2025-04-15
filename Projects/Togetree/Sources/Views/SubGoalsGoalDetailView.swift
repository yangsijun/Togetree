//
//  SubGoalsGoalDetailView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

struct SubGoalsGoalDetailView: View {
    @Binding var goal: SubGoalsGoal
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct SubGoalsGoalDetailView_Previews: PreviewProvider {
    @State static var goal = SubGoalsGoal(
        title: "챌린지 2",
        description: "챌린지2를 통해 배우고 성장하기",
        createdAt: Date(),
        updatedAt: Date(),
        startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 7))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 25))!,
        isPublic: true,
        subGoals: [
            SubGoal(title: "Solution Concept 선택하기", isCompleted: true),
            SubGoal(title: "App Statement 만들기", isCompleted: true),
            SubGoal(title: "Feature List 만들기", isCompleted: true),
            SubGoal(title: "Lofi 그리기", isCompleted: true),
            SubGoal(title: "Hifi 그리기", isCompleted: false),
        ]
    )
    
    static var previews: some View {
        SubGoalsGoalDetailView(goal: $goal)
    }
}
