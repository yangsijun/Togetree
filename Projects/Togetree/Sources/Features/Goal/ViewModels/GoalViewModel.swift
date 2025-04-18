//
//  GoalViewModel.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation

@MainActor
class GoalViewModel: ObservableObject {
    @Published var goals: [Goal] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: MockGoalService = MockGoalService.shared
    
    func loadGoalsByUser(userId: UUID) async throws {
        isLoading = true
        defer { isLoading = false }
        do {
            goals = try await service.fetchGoalsByUser(userId: userId)
        } catch {
            errorMessage = "Failed to load goals: \(error.localizedDescription)"
        }
    }

    func createGoal(_ goal: Goal) async throws {
        do {
            let created = try await service.createGoal(goal)
            goals.insert(created, at: 0)
        } catch {
            errorMessage = "Failed to create goal: \(error.localizedDescription)"
        }
    }
    
    func updateGoal(_ goal: Goal) async throws {
        do {
            let updated = try await service.updateGoal(goal)
            if let index = goals.firstIndex(where: { $0.id == updated.id }) {
                goals[index] = updated
            }
        } catch {
            errorMessage = "Failed to update goal: \(error.localizedDescription)"
        }
    }
    
    func deleteGoal(withId id: UUID) async throws {
        do {
            try await service.deleteGoal(id: id)
            goals.removeAll { $0.id == id }
        } catch {
            errorMessage = "Failed to delete goal: \(error.localizedDescription)"
        }
    }
}
