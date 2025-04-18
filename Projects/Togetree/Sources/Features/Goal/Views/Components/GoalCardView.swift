//
//  GoalCardView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct GoalCardView: View {
    @Binding var goal: Goal    
    var showTextView: Bool = true
    var expanded: Bool = false
    var showExpandButton: Bool = true
    
    var body: some View {
        VStack(spacing: 16) {
            Group {
                if showTextView {
                    GoalCardTextView(title: goal.title, description: goal.description, isPublic: goal.isPublic)
                }
            }
            Group {
                switch goal.goalType {
                case .singleGoal:
                    if let _ = goal as? SingleGoalGoal {
                        SingleGoalGoalCardContentView(
                            goal: Binding<SingleGoalGoal>(
                                get: { self.goal as! SingleGoalGoal },
                                set: { self.goal = $0 }
                            )
                        )
                    }
                case .subGoals:
                    if let _ = goal as? SubGoalsGoal {
                        SubGoalsGoalCardContentView(
                            goal: Binding<SubGoalsGoal>(
                                get: { self.goal as! SubGoalsGoal },
                                set: { self.goal = $0 }
                            ),
                            expanded: expanded,
                            showExpandButton: showExpandButton
                        )
                    }
                case .progress:
                    if let _ = goal as? ProgressGoal {
                        ProgressGoalCardContentView(
                            goal: Binding<ProgressGoal>(
                                get: { self.goal as! ProgressGoal },
                                set: { self.goal = $0 }
                            )
                        )
                    }
                }
            }
        }
        .padding(20)
        .background(
            GoalCardBackgroundView()
        )
    }
}

struct GoalCardView_Previews: PreviewProvider {
    @State static var goals: [Goal] = [
        SingleGoalGoal(
            userId: mockUserList[0].id,
            title: "앱 배포하기",
            description: "나의 첫 번째 iOS 앱 배포",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!,
            isPublic: false,
            isCompleted: false
        ),
        SubGoalsGoal(
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
        ),
        ProgressGoal(
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
        ),
    ]
    
    static var previews: some View {
        ScrollView {
            ForEach($goals) { goal in
                GoalCardView(
                    goal: goal
                )
                GoalCardView(
                    goal: goal,
                    showTextView: false
                )
            }
        }
    }
}
