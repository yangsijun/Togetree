//
//  MainView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct MainView: View {
    @State var userList: [User] = [
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
        User(name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Hello, World!"),
    ]
    @State var goalList: [Goal] = [
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
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    ProfileHorizontalListView(userList: userList)
                    Divider()
                    GoalListView(goals: $goalList)
                }
            }
            .background(Color.secondaryBackground)
            .navigationTitle(Text("Togetree"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {
                        showModal = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showModal) {
                        NavigationStack {
                            NewGoalView(goalList: $goalList, showModal: $showModal)
                        }
                    }
                }
            }
            // TODO: Implement Search feature
            .searchable(text: .constant(""))
        }
        .tint(Color.tintColor)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            userList: [
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
                User(name: "Air", profileImageUrl: "https://picsum.photos/200/300"),
            ],
            goalList: [
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
                    endProgress: 10,
                    goalLabel: "번"
                )
            ]
        )
    }
}
