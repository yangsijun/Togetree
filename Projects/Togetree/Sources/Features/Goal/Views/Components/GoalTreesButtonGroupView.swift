//
//  GoalTreesButtonGroupView.swift
//  Togetree
//
//  Created by 양시준 on 4/16/25.
//

import SwiftUI

struct GoalTreesButtonGroupView: View {
    @Binding var isCheering: Bool
    @Binding var isHelping: Bool
    
    var body: some View {
        HStack {
            Button(action: { isCheering.toggle() }) {
                HStack {
                    Image(systemName: isCheering ? "hands.clap.fill" : "hands.clap")
                    Text("응원할게요")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    isCheering
                        ? Capsule()
                        .fill(Color.secondaryAccentColor.opacity(0.15))
                            .stroke(Color.secondaryAccentColor, lineWidth: 1)
                        : Capsule()
                            .fill(Color.clear)
                            .stroke(Color.secondaryAccentColor, lineWidth: 1)
                )
            }
            Button(action: { isHelping.toggle() }) {
                HStack {
                    Image(systemName: isHelping ? "person.2.fill" : "person.2")
                    Text("도와줄게요")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    isHelping
                        ? Capsule()
                        .fill(Color.secondaryAccentColor.opacity(0.15))
                            .stroke(Color.secondaryAccentColor, lineWidth: 1)
                        : Capsule()
                            .fill(Color.clear)
                            .stroke(Color.secondaryAccentColor, lineWidth: 1)
                )
            }
        }
        .tint(Color.secondaryAccentColor)
        .frame(height: 40)
    }
}

struct GoalTreesButtonGroupView_Previews: PreviewProvider {
    @State static var isCheering: Bool = false
    @State static var isHelping: Bool = false
    
    static var previews: some View {
        GoalTreesButtonGroupView(
            isCheering: $isCheering,
            isHelping: $isHelping
        )
    }
}
