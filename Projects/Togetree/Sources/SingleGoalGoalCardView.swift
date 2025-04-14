//
//  SingleGoalGoalCardView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

public struct SingleGoalGoalCardView: View {
    @Binding var goal: SingleGoalGoal
    
    public var body: some View {
        // TODO: Implement NavigationLink
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(goal.title)
                        .font(.headline)
                    Text(goal.description ?? "")
                        .font(.caption)
                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                }
                Spacer()
                Group {
                    if goal.isPublic {
                        Image(systemName: "globe")
                    } else {
                        Image(systemName: "lock")
                    }
                }
                .foregroundStyle(Color(uiColor: .secondaryLabel))
                .frame(width: 20, height: 20)
            }
            GoalCheckBoxView(subgoal: $goal.subGoals[0])
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("TertiaryBackground"))
        )
    }
}

struct SingleGoalGoalCardView_Previews: PreviewProvider {
    @State static var goal = SingleGoalGoal(
        title: "앱 배포하기",
        description: "Togetree 앱 배포하기",
        startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 10))!
    )
    
    static var previews: some View {
        SingleGoalGoalCardView(
            goal: $goal
        )
    }
}
