//
//  SingleGoalGoalCardView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

public struct SingleGoalGoalCardView: View {
    @Binding var goal: SingleGoalGoal
    
    public var body: some View {
        NavigationLink {
            SingleGoalGoalDetailView(goal: $goal)
        } label: {
            VStack {
                GoalCardTextView(title: goal.title, description: goal.description, isPublic: goal.isPublic)
                GoalCheckBoxView(text: $goal.title, isCompleted: $goal.isCompleted)
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("TertiaryBackground"))
            )
        }
        .buttonStyle(.plain)
    }
}

struct SingleGoalGoalCardView_Previews: PreviewProvider {
    @State static var goal = SingleGoalGoal(
        title: "앱 배포하기",
        description: "Togetree 앱 배포하기",
        startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 10))!
    )
    
    static var previews: some View {
        NavigationStack {
            SingleGoalGoalCardView(
                goal: $goal
            )
        }
    }
}
