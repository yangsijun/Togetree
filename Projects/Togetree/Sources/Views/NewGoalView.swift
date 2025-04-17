//
//  NewGoalView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct NewGoalView: View {
    @Binding var goalList: [Goal]
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
    
    func addNewGoal() {
        if goalType == .singleGoal {
            goalList.append(
                SingleGoalGoal(
                    title: title,
                    description: description,
                    startDate: startDate,
                    endDate: endDate,
                    isPublic: isPublic
                )
            )
        } else if goalType == .subGoals {
            goalList.append(
                SubGoalsGoal(
                    title: title,
                    description: description,
                    startDate: startDate,
                    endDate: endDate,
                    isPublic: isPublic,
                    subGoals: subgoals
                )
            )
        } else if goalType == .progress {
            goalList.append(
                ProgressGoal(
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
    @State static var goalList: [Goal] = []
    @State static var showModal = true
    
    static var previews: some View {
        NewGoalView(goalList: $goalList, showModal: $showModal)
    }
}
