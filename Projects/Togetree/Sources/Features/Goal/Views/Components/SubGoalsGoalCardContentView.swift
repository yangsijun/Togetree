//
//  SubGoalsGoalCardView.swift
//  Togetree
//
//  Created by 양시준 on 4/15/25.
//

import SwiftUI

struct SubGoalsGoalCardContentView: View {
    @Binding var goal: SubGoalsGoal
    var isMyGoal: Bool
    @State var expanded: Bool = false
    var showExpandButton: Bool = true
    
    var body: some View {
        VStack(spacing: 16) {
            GoalProgressBarView(
                currentProgress: .constant(goal.subGoals.filter(\.isCompleted).count),
                endProgress: goal.subGoals.count
            )
            .animation(.easeInOut, value: goal.subGoals.filter(\.isCompleted).count)
            VStack(spacing: 10) {
                if expanded {
                    ForEach($goal.subGoals) { subGoal in
                        GoalCheckBoxView(text: subGoal.title.wrappedValue, isCompleted: subGoal.isCompleted, isMyGoal: isMyGoal)
                    }
                } else {
                    if let index = goal.subGoals.firstIndex(where: { !$0.isCompleted }) {
                        GoalCheckBoxView(
                            text: goal.subGoals[index].title,
                            isCompleted: $goal.subGoals[index].isCompleted,
                            isMyGoal: isMyGoal
                        )
                    }
                }
            }
            Group {
                if showExpandButton {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                expanded.toggle()
                            }
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: expanded ? "chevron.up" : "chevron.down")
                                Text(expanded ? "Show Less" : "Show More")
                                    .font(.caption)
                            }
                            .foregroundStyle(.secondary)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

struct SubGoalsGoalCardContentView_Previews: PreviewProvider {
    @State static var goal = SubGoalsGoal(
        userId: mockUserList[0].id,
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
            VStack {
                SubGoalsGoalCardContentView(
                    goal: $goal,
                    isMyGoal: true
                )
                SubGoalsGoalCardContentView(
                    goal: $goal,
                    isMyGoal: true,
                    expanded: true,
                    showExpandButton: false
                )
            }
        }
    }
}
