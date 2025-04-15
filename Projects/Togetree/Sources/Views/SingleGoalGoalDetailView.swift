//
//  SingleGoalGoalDetailView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

struct SingleGoalGoalDetailView: View {
    @Binding var goal: SingleGoalGoal
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct SingleGoalGoalDetailView_Previews: PreviewProvider {
    @State static var goal = SingleGoalGoal(
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
        SingleGoalGoalDetailView(goal: $goal)
    }
}
