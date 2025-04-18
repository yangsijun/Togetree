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
    @State var subgoals: [SubGoal] = []
    @State var endGoal: String = ""
    @State var progressLabel: String = ""
    @State var startValue: String = ""
    @State var goalType: GoalType = .singleGoal
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    @State var isPublic: Bool = true
    
    var authViewModel = AuthViewModel()
    
    func addNewGoal() {
        if goalType == .singleGoal {
            goalViewModel.goals.append(
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
            goalViewModel.goals.append(
                SubGoalsGoal(
                    userId: authViewModel.currentUserId!,
                    title: title,
                    description: description,
                    startDate: startDate,
                    endDate: endDate,
                    isPublic: isPublic,
                    subGoals: subgoals
                )
            )
        } else if goalType == .progress {
            goalViewModel.goals.append(
                ProgressGoal(
                    userId: authViewModel.currentUserId!,
                    title: title,
                    description: description,
                    startDate: startDate,
                    endDate: endDate,
                    isPublic: isPublic,
                    currentProgress: Int(startValue) ?? 0,
                    endProgress: Int(endGoal) ?? 1,
                    goalLabel: progressLabel
                )
            )
        }
    }
    
    var body: some View {
        GoalFormView(
            title: $title,
            description: $description,
            subgoals: $subgoals,
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
                    addNewGoal()
                    showModal = false
                }
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
