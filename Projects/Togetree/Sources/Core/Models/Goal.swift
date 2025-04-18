//
//  Goal.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import Foundation

public class Goal: Identifiable, Codable {
    public var id: UUID
    public var userId: UUID
    public var title: String
    public var description: String
    public var createdAt: Date
    public var updatedAt: Date
    public var goalType: GoalType
    public var startDate: Date
    public var endDate: Date
    public var isPublic: Bool
    
    init(
        id: UUID = UUID(),
        userId: UUID,
        title: String,
        description: String,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType = .singleGoal,
        startDate: Date,
        endDate: Date,
        isPublic: Bool = true
    ) {
        self.id = id
        self.userId = userId
        self.title = title
        self.description = description
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.goalType = goalType
        self.startDate = startDate
        self.endDate = endDate
        self.isPublic = isPublic
    }
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case id
        case userId
        case title
        case description
        case createdAt
        case updatedAt
        case goalType
        case startDate
        case endDate
        case isPublic
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(UUID.self, forKey: .id)
        self.userId = try container.decode(UUID.self, forKey: .userId)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.goalType = try container.decode(GoalType.self, forKey: .goalType)
        self.startDate = try container.decode(Date.self, forKey: .startDate)
        self.endDate = try container.decode(Date.self, forKey: .endDate)
        self.isPublic = try container.decode(Bool.self, forKey: .isPublic)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(userId, forKey: .userId)
        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(goalType, forKey: .goalType)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(endDate, forKey: .endDate)
        try container.encode(isPublic, forKey: .isPublic)
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
        userId: UUID,
        title: String,
        description: String,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType = .singleGoal,
        startDate: Date,
        endDate: Date,
        isPublic: Bool = true,
        isCompleted: Bool = false
    ) {
        self.isCompleted = isCompleted
        super.init(id: id, userId: userId, title: title, description: description, createdAt: createdAt, updatedAt: updatedAt, goalType: goalType, startDate: startDate, endDate: endDate, isPublic: isPublic)
    }
    
    private enum CodingKeys: String, CodingKey {
        case isCompleted
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(isCompleted, forKey: .isCompleted)
    }
}

public struct SubGoal: Identifiable, Codable {
    public var id: UUID = UUID()
    public var title: String
    public var isCompleted: Bool = false
}

public class SubGoalsGoal: Goal {
    public var subGoals: [SubGoal]
    
    init(
        id: UUID = UUID(),
        userId: UUID,
        title: String,
        description: String,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType = .subGoals,
        startDate: Date,
        endDate: Date,
        isPublic: Bool = true,
        subGoals: [SubGoal]
    ) {
        self.subGoals = subGoals
        super.init(id: id, userId: userId, title: title, description: description, createdAt: createdAt, updatedAt: updatedAt, goalType: goalType, startDate: startDate, endDate: endDate, isPublic: isPublic)
    }
    
    private enum CodingKeys: String, CodingKey {
        case subGoals
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.subGoals = try container.decode([SubGoal].self, forKey: .subGoals)
        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(subGoals, forKey: .subGoals)
    }
}

public class ProgressGoal: Goal {
    public var currentProgress: Int
    public var endProgress: Int
    public var goalLabel: String?
    
    init(
        id: UUID = UUID(),
        userId: UUID,
        title: String,
        description: String,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        goalType: GoalType = .progress,
        startDate: Date,
        endDate: Date,
        isPublic: Bool = true,
        currentProgress: Int,
        endProgress: Int,
        goalLabel: String
    ) {
        self.currentProgress = currentProgress
        self.endProgress = endProgress
        self.goalLabel = goalLabel
        super.init(id: id, userId: userId, title: title, description: description, createdAt: createdAt, updatedAt: updatedAt, goalType: goalType, startDate: startDate, endDate: endDate, isPublic: isPublic)
    }
    
    private enum CodingKeys: String, CodingKey {
        case currentProgress, endProgress, goalLabel
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentProgress = try container.decode(Int.self, forKey: .currentProgress)
        self.endProgress = try container.decode(Int.self, forKey: .endProgress)
        self.goalLabel = try container.decode(String.self, forKey: .goalLabel)
        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(currentProgress, forKey: .currentProgress)
        try container.encode(endProgress, forKey: .endProgress)
        try container.encode(goalLabel, forKey: .goalLabel)
    }
}
