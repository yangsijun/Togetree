//
//  GoalDetailView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct GoalDetailView: View {
    @Binding var goal: Goal
    var isMyGoal: Bool = false
    @State var cheerTreesList: [User] = Array(
        repeating: User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        count: 9
    )
    @State var helpTreesList: [User] = Array(
        repeating: User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        count: 12
    )
    @State var isCheering: Bool = false
    @State var isHelping: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                GoalTitleCardView(goal: goal)
                GoalCardView(
                    goal: $goal,
                    showTextView: false,
                    expanded: true,
                    showExpandButton: false
                )
                GoalStartEndDateTextView(startDate: goal.startDate, endDate: goal.endDate)
                Divider()
                    .padding(.vertical, 24)
                GoalTreesHorizontalListView(title: "응원나무", userList: $cheerTreesList)
                GoalTreesHorizontalListView(title: "도움나무", userList: $helpTreesList)
                Group {
                    if !isMyGoal {
                        GoalTreesButtonGroupView(isCheering: $isCheering, isHelping: $isHelping)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            .padding(.bottom, 32)
        }
        .background(Color("SecondaryBackground"))
        .toolbar {
            ToolbarItemGroup {
                Button(action: {
                    // TODO: Share Goal
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
                Button(action: {
                    // TODO: Edit Goal
                }) {
                    Image(systemName: "ellipsis")
                }
            }
        }
        .tint(Color("PrimaryColor"))
    }
}
    
struct GoalDetailView_Previews: PreviewProvider {
    @State static var goalList: [Goal] = [
        SingleGoalGoal(
            title: "앱 배포하기",
            description: "dfdsdfsdf",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!,
            isPublic: false,
            isCompleted: false
        ),
        SubGoalsGoal(
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
            title: "러닝으로 건강한 몸과 마음 만들기",
            description: "4월 한 달 동안 3km 러닝 10번 하기",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!,
            isPublic: true,
            currentProgress: 4,
            endProgress: 10
        ),
    ]
    
    static var previews: some View {
        GoalDetailView(goal: $goalList[1])
    }
}
