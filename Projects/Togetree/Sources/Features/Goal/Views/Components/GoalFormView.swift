//
//  GoalFormView.swift
//  Togetree
//
//  Created by 양시준 on 4/17/25.
//

import SwiftUI

struct GoalFormView: View {
    @Binding var title: String
    @Binding var description: String
    @Binding var subgoals: [SubGoal]
    @Binding var endGoal: String
    @Binding var progressLabel: String
    @Binding var startValue: String
    @Binding var goalType: GoalType
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var isPublic: Bool
    @State var newSubgoalText: String = ""
    
    var body: some View {
        Form {
            GoalFormTitleDescriptionView(title: $title, description: $description)
            GoalFormDetailView(
                goalType: $goalType,
                subgoals: $subgoals,
                endGoal: $endGoal,
                progressLabel: $progressLabel,
                startValue: $startValue
            )
            GoalFormGoalTypeView(goalType: $goalType)
            GoalFormDatesView(startDate: $startDate, endDate: $endDate)
            GoalFormVisibilityView(isPublic: $isPublic)
        }
        .tint(Color.tintColor)
        .scrollContentBackground(.hidden)
        .background(Color.secondaryBackground)
    }
}

struct GoalFormView_Previews: PreviewProvider {
    @State static var title: String = ""
    @State static var description: String = ""
    @State static var subgoals: [SubGoal] = []
    @State static var endGoal: String = ""
    @State static var progressLabel: String = ""
    @State static var startValue: String = ""
    @State static var goalType: GoalType = .singleGoal
    @State static var startDate: Date = Date()
    @State static var endDate: Date = Date()
    @State static var isPublic: Bool = true
    
    static var previews: some View {
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
    }
}


struct GoalFormTitleDescriptionView: View {
    @Binding var title: String
    @Binding var description: String
    
    var body: some View {
        Section {
            TextField("Goal Title", text: $title)
                .font(.title)
                .foregroundStyle(Color.accentColor)
                .bold()
                .padding(.vertical, 16)
            TextField("Goal Description (Optional)", text: $description)
                .padding(.vertical, 8)
        }
    }
}

struct GoalFormDetailView: View {
    @Binding var goalType: GoalType
    @Binding var subgoals: [SubGoal]
    @State var newSubgoalText: String = ""
    @Binding var endGoal: String
    @Binding var progressLabel: String
    @Binding var startValue: String
    
    var body: some View {
        switch(goalType) {
        case .singleGoal:
            EmptyView()
        case .subGoals:
            Section("Sub Goals") {
                ForEach($subgoals) { subgoal in
                    TextField("Sub Goal", text: subgoal.title)
                }
                .onDelete(
                    perform: { offsets in
                        subgoals.remove(atOffsets: offsets)
                    }
                )
                TextField("New Sub Goal", text: $newSubgoalText)
                    .onSubmit {
                        if !newSubgoalText.isEmpty {
                            subgoals.append(
                                SubGoal(title: newSubgoalText)
                            )
                            newSubgoalText = ""
                        }
                    }
            }
        case .progress:
            Section("Progress") {
                LabeledContent("End Goal") {
                    TextField("", text: $endGoal)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                        .onChange(of: startValue) {
                            startValue = startValue.filter { $0.isNumber }
                        }
                }
                LabeledContent("Progress Label") {
                    TextField("e.g. Times", text: $progressLabel)
                        .multilineTextAlignment(.trailing)
                }
                LabeledContent("Start Value") {
                    TextField("", text: $startValue)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                        .onChange(of: startValue) {
                            startValue = startValue.filter { $0.isNumber }
                        }
                }
            }
        }
    }
}

struct GoalFormGoalTypeView: View {
    @Binding var goalType: GoalType
    
    var body: some View {
        Section("Goal Type") {
            Picker(selection: $goalType) {
                HStack {
                    Image(systemName: "checkmark.square")
                        .font(.largeTitle)
                        .foregroundStyle(Color.primary)
                    VStack(alignment: .leading) {
                        Text("Single Goal")
                            .foregroundStyle(Color.label)
                        Text("Goal has only one task")
                            .font(.caption)
                            .foregroundStyle(Color.secondaryLabel)
                    }
                }
                .tag(GoalType.singleGoal)
                HStack {
                    Image(systemName: "list.bullet")
                        .font(.largeTitle)
                        .foregroundStyle(Color.primary)
                    VStack(alignment: .leading) {
                        Text("Sub Goals")
                            .foregroundStyle(Color.label)
                        Text("Goal with multiple subtasks")
                            .font(.caption)
                            .foregroundStyle(Color.secondaryLabel)
                    }
                }
                .tag(GoalType.subGoals)
                HStack {
                    Image(systemName: "progress.indicator")
                        .font(.largeTitle)
                        .foregroundStyle(Color.primary)
                    VStack(alignment: .leading) {
                        Text("Progress")
                            .foregroundStyle(Color.label)
                        Text("Progressive goal")
                            .font(.caption)
                            .foregroundStyle(Color.secondaryLabel)
                    }
                }
                .tag(GoalType.progress)
            } label: {
                
            }
            .pickerStyle(.inline)
        }
    }
}

struct GoalFormDatesView: View {
    @Binding var startDate: Date
    @Binding var endDate: Date
    
    var body: some View {
        Section {
            DatePicker(
                "Start Date",
                selection: $startDate,
                displayedComponents: [.date]
            )
            DatePicker(
                "End Date",
                selection: $endDate,
                displayedComponents: [.date]
            )
        }
    }
}

struct GoalFormVisibilityView: View {
    @Binding var isPublic: Bool
    
    var body: some View {
        Section {
            Picker(selection: $isPublic) {
                Text("Public").tag(true)
                Text("Private").tag(false)
            } label: {
                Text("Visibility")
            }
        }
    }
}
