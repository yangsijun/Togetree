//
//  SingleGoalGoalCardView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct SingleGoalGoalCardContentView: View {
    @Binding var goal: SingleGoalGoal
    var isMyGoal: Bool
    
    var body: some View {
        GoalCheckBoxView(text: goal.title, isCompleted: $goal.isCompleted, isMyGoal: isMyGoal)
    }
}

struct SingleGoalGoalCardContentView_Previews: PreviewProvider {
    @State static var goal = SingleGoalGoal(
        userId: mockUserList[0].id,
        title: "앱 배포하기",
        description: "Togetree 앱 배포하기",
        startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 10))!
    )
    
    static var previews: some View {
        VStack {
            SingleGoalGoalCardContentView(goal: $goal, isMyGoal: true)
        }
    }
}
