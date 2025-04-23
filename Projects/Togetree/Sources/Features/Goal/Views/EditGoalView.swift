//
//  EditGoalView.swift
//  Togetree
//
//  Created by 양시준 on 4/19/25.
//

import SwiftUI

struct EditGoalView: View {
    var goalViewModel: GoalViewModel
    
    @Environment(UserViewModel.self) var myUserViewModel
    
    @Binding var goal: Goal
    @Binding var showModal: Bool

    @State var title: String = ""
    @State var description: String = ""
    @State var isCompleted: Bool = false
    @State var subGoals: [SubGoal] = []
    @State var endGoal: String = ""
    @State var progressLabel: String = ""
    @State var startValue: String = ""
    @State var goalType: GoalType = .singleGoal
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    @State var isPublic: Bool = true
    
    var isValidForm: Bool {
        switch goalType {
        case .singleGoal:
            return !title.isEmpty
        case .subGoals:
            return !title.isEmpty && !subGoals.isEmpty
        case .progress:
            return !title.isEmpty && !startValue.isEmpty && !endGoal.isEmpty
        }
    }
    
    func editGoal() async throws {
        switch goalType {
        case .singleGoal:
            goal = SingleGoalGoal(
                id: goal.id,
                userId: myUserViewModel.user!.id,
                title: title,
                description: description,
                startDate: startDate,
                endDate: endDate,
                isPublic: isPublic,
                isCompleted: isCompleted
            )
        case .subGoals:
            goal = SubGoalsGoal(
                id: goal.id,
                userId: myUserViewModel.user!.id,
                title: title,
                description: description,
                startDate: startDate,
                endDate: endDate,
                isPublic: isPublic,
                subGoals: subGoals
            )
        case .progress:
            goal = ProgressGoal(
                id: goal.id,
                userId: myUserViewModel.user!.id,
                title: title,
                description: description,
                startDate: startDate,
                endDate: endDate,
                isPublic: isPublic,
                currentProgress: Int(startValue)!,
                endProgress: Int(endGoal)!,
                goalLabel: progressLabel
            )
        }
        do {
            try await goalViewModel.updateGoal(goal)
        } catch {
            print(error.localizedDescription)
        }
    }
        
    var body: some View {
        GoalFormView(
            title: $title,
            description: $description,
            subgoals: $subGoals,
            endGoal: $endGoal,
            progressLabel: $progressLabel,
            startValue: $startValue,
            goalType: $goalType,
            startDate: $startDate,
            endDate: $endDate,
            isPublic: $isPublic
        )
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    showModal = false
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Confirm") {
                    Task {
                        do {
                            try await editGoal()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    showModal = false
                }
                .disabled(!isValidForm)
            }
        }
        .onAppear {
            title = goal.title
            description = goal.description
            goalType = goal.goalType
            startDate = goal.startDate
            endDate = goal.endDate
            isPublic = goal.isPublic
            
            switch goal.goalType {
            case .singleGoal:
                if let singleGoal = goal as? SingleGoalGoal {
                    isCompleted = singleGoal.isCompleted
                }
            case .subGoals:
                if let subGoalsGoal = goal as? SubGoalsGoal {
                    subGoals = subGoalsGoal.subGoals
                }
            case .progress:
                if let progressGoal = goal as? ProgressGoal {
                    endGoal = String(progressGoal.endProgress)
                    progressLabel = progressGoal.goalLabel ?? ""
                    startValue = String(progressGoal.currentProgress)
                }
            }
        }
    }
}

struct EditGoalView_Previews: PreviewProvider {
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
    @State static var showModal = true
    static var previews: some View {
        EditGoalView(goalViewModel: goalViewModel, goal: $goals[0], showModal: $showModal)
            .environment(myUserViewModel)
            .task {
                do {
                    try await myUserViewModel.loadUser(with: user.id)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}
