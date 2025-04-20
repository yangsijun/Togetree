//
//  EditGoalView.swift
//  Togetree
//
//  Created by 양시준 on 4/19/25.
//

import SwiftUI

struct EditGoalView: View {
    @ObservedObject var goalViewModel: GoalViewModel
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    
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
                userId: authViewModel.currentUser!.id,
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
                userId: authViewModel.currentUser!.id,
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
                userId: authViewModel.currentUser!.id,
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
