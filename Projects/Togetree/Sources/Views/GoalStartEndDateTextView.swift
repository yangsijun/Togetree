//
//  GoalStartEndDateTextView.swift
//  Togetree
//
//  Created by 양시준 on 4/16/25.
//

import SwiftUI

public struct GoalStartEndDateTextView: View {
    var startDate: Date
    var endDate: Date
    
    public var body: some View {
        VStack {
            HStack {
                Text("Start Date")
                Spacer()
                Text(startDate.localizedDateString)
            }
            HStack {
                Text("End Date")
                Spacer()
                Text(endDate.localizedDateString)
            }
        }
        .font(.caption)
        .foregroundStyle(.secondary)
    }
}

#Preview {
    GoalStartEndDateTextView(
        startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!
    )
}
