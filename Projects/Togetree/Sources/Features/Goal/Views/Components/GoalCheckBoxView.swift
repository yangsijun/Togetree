//
//  GoalCheckBoxView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct GoalCheckBoxView: View {
    var text: String
    @Binding var isCompleted: Bool
    var isMyGoal: Bool
    
    var body: some View {
        Group {
            HStack {
                Group {
                    if isCompleted {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.accentColor)
                            .frame(width: 16, height: 16)
                    } else {
                        RoundedRectangle(cornerRadius: 4)
                            .strokeBorder(Color.accentColor, lineWidth: 1)
                            .frame(width: 16, height: 16)
                    }
                }
                Group {
                    if isCompleted {
                        Text(text)
                            .foregroundStyle(Color.secondaryLabel)
                            .strikethrough(true, color: Color.secondaryLabel)
                    } else {
                        Text(text)
                    }
                }
                Spacer()
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.tertiaryFill)
            )
        }
        .onTapGesture {
            if isMyGoal {
                isCompleted.toggle()                
            }
        }
    }
}

struct GoalCheckBoxView_Previews: PreviewProvider {
    @State static var subgoal: SubGoal = SubGoal(
        title: "Lorem Ipsum",
        isCompleted: true
    )
    @State static var subgoal_1: SubGoal = SubGoal(
        title: "Lorem Ipsum",
        isCompleted: false
    )
    
    static var previews: some View {
        VStack {
            GoalCheckBoxView(text: subgoal.title, isCompleted: $subgoal.isCompleted, isMyGoal: true)
            GoalCheckBoxView(text: subgoal_1.title, isCompleted: $subgoal_1.isCompleted, isMyGoal: true)
        }
    }
}
