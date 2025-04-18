//
//  GoalService.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation

class GoalService {
    // TODO: API URL
    let baseURL = URL(string: "")!
    
    func fetchGoalsByUser(userId: UUID) async throws -> [Goal] {
        let url = baseURL.appendingPathComponent("goals/\(userId.uuidString)")
        return try await APIClient.get(url)
    }

    func createGoal(_ goal: Goal) async throws -> Goal {
        let url = baseURL.appendingPathComponent("goals")
        return try await APIClient.post(url, body: goal)
    }

    func updateGoal(_ goal: Goal) async throws -> Goal {
        let url = baseURL.appendingPathComponent("goals/\(goal.id.uuidString)")
        return try await APIClient.put(url, body: goal)
    }

    func deleteGoal(id: UUID) async throws {
        let url = baseURL.appendingPathComponent("goals/\(id.uuidString)")
        try await APIClient.delete(url)
    }
}
