//
//  NewGoalView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct NewGoalView: View {
    @Binding var showModal: Bool
    @State var title: String = ""
    @State var description: String = ""
    @State var subgoals: [String] = []
    @State var endGoal: String = ""
    @State var progressLabel: String = ""
    @State var startValue: String = ""
    @State var goalType: GoalType = .singleGoal
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    @State var isPublic: Bool = true
    
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
                        // TODO: Add a new goal
                        showModal = false
                    }
                }
            }
    }
}

struct NewGoalView_Previews: PreviewProvider {
    @State static var showModal = true
    
    static var previews: some View {
        NewGoalView(showModal: $showModal)
    }
}
