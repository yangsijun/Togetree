//
//  NewGoalView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct NewGoalView: View {
    @ObservedObject var goalViewModel: GoalViewModel
    @Binding var showModal: Bool
    
    @State var title: String = ""
    @State var description: String = ""
    @State var subGoals: [SubGoal] = []
    @State var endGoal: String = ""
    @State var progressLabel: String = ""
    @State var startValue: String = ""
    @State var goalType: GoalType = .singleGoal
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    @State var isPublic: Bool = true
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    
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
    
    func addNewGoal() async throws {
        do {
            if goalType == .singleGoal {
                try await goalViewModel.createGoal(
                    SingleGoalGoal(
                        userId: authViewModel.currentUserId!,
                        title: title,
                        description: description,
                        startDate: startDate,
                        endDate: endDate,
                        isPublic: isPublic
                    )
                )
            } else if goalType == .subGoals {
                try await goalViewModel.createGoal(
                    SubGoalsGoal(
                        userId: authViewModel.currentUserId!,
                        title: title,
                        description: description,
                        startDate: startDate,
                        endDate: endDate,
                        isPublic: isPublic,
                        subGoals: subGoals
                    )
                )
            } else if goalType == .progress {
                try await goalViewModel.createGoal(
                    ProgressGoal(
                        userId: authViewModel.currentUserId!,
                        title: title,
                        description: description,
                        startDate: startDate,
                        endDate: endDate,
                        isPublic: isPublic,
                        currentProgress: Int(startValue)!,
                        endProgress: Int(endGoal)!,
                        goalLabel: progressLabel
                    )
                )
            }
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
                            try await addNewGoal()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    showModal = false
                }
                .disabled(!isValidForm)
            }
        }
    }
}

struct NewGoalView_Previews: PreviewProvider {
    @StateObject static var goalViewModel = GoalViewModel()
    @State static var showModal = true
    
    static var previews: some View {
        NewGoalView(
            goalViewModel: goalViewModel,
            showModal: $showModal
        )
    }
}
