//
//  GoalListView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct GoalListView: View {
    @Environment(UserViewModel.self) var myUserViewModel
    var user: User
    @Bindable var goalViewModel: GoalViewModel
    var isMyGoal: Bool
    
    var body: some View {
        VStack(spacing: 18) {
            ForEach($goalViewModel.goals) { goal in
                GoalCardNavigationLinkView(goal: goal, isMyGoal: myUserViewModel.user!.id == user.id)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .onAppear {
            Task {
                do {
                    try await goalViewModel.loadGoalsByUser(userId: user.id)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .onChange(of: user) {
            Task {
                do {
                    try await goalViewModel.loadGoalsByUser(userId: user.id)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct GoalListView_Previews: PreviewProvider {
    @State static var goals: [Goal] = [
        SingleGoalGoal(
            userId: mockUserList[0].id,
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
        )
    ]
    
    @State static var user: User = mockUserList[0]
    @State static var goalViewModel = GoalViewModel()
    @State static var myUserViewModel = UserViewModel()

    static var previews: some View {
        NavigationStack {
            GoalListView(user: user, goalViewModel: goalViewModel, isMyGoal: true)
                .environment(myUserViewModel)
                .task {
                    do {
                        try await myUserViewModel.loadUser(with: user.id)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
        .tint(Color.tintColor)
    }
}
