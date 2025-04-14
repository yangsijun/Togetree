//
//  GoalCheckBoxView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

public struct GoalCheckBoxView: View {
    @Binding var subgoal: SubGoal
    
    public var body: some View {
        HStack {
            Group {
                if subgoal.completed {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color("AccentColor"))
                        .frame(width: 16, height: 16)
                } else {
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(Color("AccentColor"), lineWidth: 1)
                        .frame(width: 16, height: 16)
                }
            }
            Group {
                if subgoal.completed {
                    Text(subgoal.title)
                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                        .strikethrough(true, color: Color(uiColor: .secondaryLabel))
                } else {
                    Text(subgoal.title)
                }
            }
            Spacer()
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("TertiaryFill"))
        )
    }
}

struct GoalCheckBoxView_Previews: PreviewProvider {
    @State static var subgoal: SubGoal = SubGoal(
        title: "Lorem Ipsum",
        completed: true
    )
    @State static var subgoal_1: SubGoal = SubGoal(
        title: "Lorem Ipsum",
        completed: false
    )
    
    static var previews: some View {
        VStack {
            GoalCheckBoxView(subgoal: $subgoal)
            GoalCheckBoxView(subgoal: $subgoal_1)
        }
    }
}
