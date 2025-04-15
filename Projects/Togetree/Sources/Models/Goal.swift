//
//  Goal.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import Foundation

public class Goal: Identifiable {
    public var id: UUID
    public var title: String
    public var description: String?
    public var createdAt: Date
    public var updatedAt: Date
    public var goalType: GoalType
    public var startDate: Date
    public var endDate: Date
    public var isPublic: Bool
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType = .singleGoal,
        startDate: Date,
        endDate: Date,
        isPublic: Bool = true
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.goalType = goalType
        self.startDate = startDate
        self.endDate = endDate
        self.isPublic = isPublic
    }
}

public enum GoalType: String, Codable {
    case singleGoal
    case subGoals
    case progress
}



public class SingleGoalGoal: Goal {
    public var isCompleted: Bool = false
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType = .singleGoal,
        startDate: Date,
        endDate: Date,
        isPublic: Bool = true,
        isCompleted: Bool = false
    ) {
        self.isCompleted = isCompleted
        super.init(id: id, title: title, description: description, createdAt: createdAt, updatedAt: updatedAt, goalType: goalType, startDate: startDate, endDate: endDate, isPublic: isPublic)
    }
}

public struct SubGoal: Identifiable {
    public var id: UUID = UUID()
    public var title: String
    public var isCompleted: Bool = false
}

public class SubGoalsGoal: Goal {
    public var subGoals: [SubGoal]
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType = .subGoals,
        startDate: Date,
        endDate: Date,
        isPublic: Bool = true,
        subGoals: [SubGoal]
    ) {
        self.subGoals = subGoals
        super.init(id: id, title: title, description: description, createdAt: createdAt, updatedAt: updatedAt, goalType: goalType, startDate: startDate, endDate: endDate, isPublic: isPublic)
    }
}

public class ProgressGoal: Goal {
    public var currentProgress: Int
    public var endProgress: Int
    public var goalLabel: String?
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType = .progress,
        startDate: Date,
        endDate: Date,
        isPublic: Bool = true,
        currentProgress: Int,
        endProgress: Int,
        goalLabel: String? = nil
    ) {
        self.currentProgress = currentProgress
        self.endProgress = endProgress
        self.goalLabel = goalLabel
        super.init(id: id, title: title, description: description, createdAt: createdAt, updatedAt: updatedAt, goalType: goalType, startDate: startDate, endDate: endDate, isPublic: isPublic)
    }
}
