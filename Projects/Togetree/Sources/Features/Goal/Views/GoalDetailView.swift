//
//  GoalDetailView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct GoalDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var goal: Goal
    @StateObject private var goalViewModel = GoalViewModel()
    var isMyGoal: Bool = false
    @State var showEditModal: Bool = false
    @State var showDeleteAlert: Bool = false
    
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
        .background(Color.secondaryBackground)
        .toolbar {
            ToolbarItemGroup {
                Button(action: {
                    // TODO: Share Goal
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
                Menu {
                    Button(
                        "Edit Goal",
                        action: { showEditModal = true }
                    )
                    Button(
                        "Delete Goal",
                        action: { showDeleteAlert = true }
                    )
                } label: {
                    Label("Menu", systemImage: "ellipsis")
                }
                .sheet(isPresented: $showEditModal) {
                    NavigationStack {
                        EditGoalView(goalViewModel: goalViewModel, goal: $goal, showModal: $showEditModal)
                    }
                }
                .alert("정말 삭제할까요?", isPresented: $showDeleteAlert) {
                    Button("삭제", role: .destructive) {
                        Task {
                            do {
                                try await goalViewModel.deleteGoal(withId: goal.id)
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                        dismiss()
                    }
                    Button("취소", role: .cancel) { }
                } message: {
                    Text("이 작업은 되돌릴 수 없습니다.")
                }
            }
        }
        .tint(Color.tintColor)
        .task {
            do {
                try await goalViewModel.loadGoalsByUser(userId: goal.userId)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
    
struct GoalDetailView_Previews: PreviewProvider {
    @State static var goalList: [Goal] = [
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
        ),
    ]
    
    static var previews: some View {
        GoalDetailView(goal: $goalList[1])
    }
}
