//
//  SubGoalsGoalCardView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

public struct SubGoalsGoalCardView: View {
    @Binding var goal: SubGoalsGoal
    @State var expanded: Bool = false
    
    public var body: some View {
        NavigationLink {
            SubGoalsGoalDetailView(goal: $goal)
        } label: {
            VStack(spacing: 8) {
                GoalCardTextView(title: goal.title, description: goal.description, isPublic: goal.isPublic)
                GoalProgressBarView(currentProgress: goal.subGoals.filter(\.isCompleted).count, endProgress: goal.subGoals.count)
                Group {
                    if expanded {
                        ForEach($goal.subGoals) { subGoal in
                            GoalCheckBoxView(text: subGoal.title.wrappedValue, isCompleted: subGoal.isCompleted)
                        }
                    } else {
                        if let index = goal.subGoals.firstIndex(where: { !$0.isCompleted }) {
                            GoalCheckBoxView(
                                text: goal.subGoals[index].title,
                                isCompleted: $goal.subGoals[index].isCompleted
                            )
                        }
                    }
                }
                .padding(.top, 4)
                Button(action: {
                    expanded.toggle()
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: expanded ? "chevron.up" : "chevron.down")
                        Text(expanded ? "Show Less" : "Show More")
                            .font(.caption)
                    }
                    .foregroundStyle(.secondary)
                    .padding(.top, 4)
                }
                .buttonStyle(.plain)
            }
            .padding(20)
            .background(
                GoalCardBackgroundView()
            )
        }
        .buttonStyle(.plain)
    }
}

struct SubGoalsGoalCardView_Previews: PreviewProvider {
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
        NavigationStack {
            SubGoalsGoalCardView(
                goal: $goal
            )
        }
    }
}
