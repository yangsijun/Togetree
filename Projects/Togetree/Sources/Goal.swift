//
//  Goal.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import Foundation

public class Goal {
    public var id: UUID
    public var title: String
    public var description: String?
    public var createdAt: Date
    public var updatedAt: Date
    public var goalType: GoalType
    public var startDate: Date
    public var endDate: Date
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType = .singleGoal,
        startDate: Date,
        endDate: Date
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.goalType = goalType
        self.startDate = startDate
        self.endDate = endDate
    }
}

public enum GoalType: String, Codable {
    case singleGoal
    case subGoals
    case progress
}



public class SingleGoalGoal: Goal {
    public var completed: Bool = false
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType,
        startDate: Date,
        endDate: Date,
        completed: Bool = false
    ) {
        self.completed = completed
        super.init(id: id, title: title, description: description, createdAt: createdAt, updatedAt: updatedAt, goalType: goalType, startDate: startDate, endDate: endDate)
    }
}

public struct SubGoal: Identifiable {
    public var id: UUID = UUID()
    public var title: String
    public var completed: Bool = false
}

public class SubGoalsGoal: Goal {
    public var subGoals: [SubGoal]
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType,
        startDate: Date,
        endDate: Date,
        subGoals: [SubGoal]
    ) {
        self.subGoals = subGoals
        super.init(id: id, title: title, description: description, createdAt: createdAt, updatedAt: updatedAt, goalType: goalType, startDate: startDate, endDate: endDate)
    }
}

public class ProgressGoal: Goal {
    public var currentProgress: Int
    public var endProgress: Int
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType,
        startDate: Date,
        endDate: Date,
        currentProgress: Int,
        endProgress: Int
    ) {
        self.currentProgress = currentProgress
        self.endProgress = endProgress
        super.init(id: id, title: title, description: description, createdAt: createdAt, updatedAt: updatedAt, goalType: goalType, startDate: startDate, endDate: endDate)
    }
}
