//
//  GoalCheckBoxView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

public struct GoalCheckBoxView: View {
    var text: String
    @Binding var isCompleted: Bool
    
    public var body: some View {
        Group {
            HStack {
                Group {
                    if isCompleted {
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
                    if isCompleted {
                        Text(text)
                            .foregroundStyle(Color(uiColor: .secondaryLabel))
                            .strikethrough(true, color: Color(uiColor: .secondaryLabel))
                    } else {
                        Text(text)
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
        .onTapGesture {
            isCompleted.toggle()
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
            GoalCheckBoxView(text: subgoal.title, isCompleted: $subgoal.isCompleted)
            GoalCheckBoxView(text: subgoal_1.title, isCompleted: $subgoal_1.isCompleted)
        }
    }
}
