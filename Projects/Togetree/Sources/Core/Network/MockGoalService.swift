//
//  MockGoalService.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation

class MockGoalService {
    var users: [User] = mockUserList
    var goals: [Goal] = [
        SingleGoalGoal(
            userId: mockUserList[0].id,
            title: "앱 배포하기",
            description: "나의 첫 번째 iOS 앱 배포",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!,
            isPublic: false,
            isCompleted: false
        ),
        SubGoalsGoal(
            userId: mockUserList[0].id,
            title: "챌린지 2",
            description: "챌린지2를 통해 배우고 성장하기",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 7))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 25))!,
            isPublic: true,
            subGoals: [
                SubGoal(title: "Solution Concept 선택하기", isCompleted: true),
                SubGoal(title: "App Statement 만들기", isCompleted: true),
                SubGoal(title: "Feature List 만들기", isCompleted: true),
                SubGoal(title: "Lofi 그리기", isCompleted: true),
                SubGoal(title: "Hifi 그리기", isCompleted: false),
            ]
        ),
        ProgressGoal(
            userId: mockUserList[0].id,
            title: "러닝으로 건강한 몸과 마음 만들기",
            description: "4월 한 달 동안 3km 러닝 10번 하기",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!,
            isPublic: true,
            currentProgress: 4,
            endProgress: 10
        ),
        SingleGoalGoal(
            userId: mockUserList[1].id,
            title: "3km 러닝 뛰기",
            description: "힘들고 지루한 3km 러닝을 해보기",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 30))!,
            isPublic: true,
            isCompleted: false
        ),
        SubGoalsGoal(
            userId: mockUserList[1].id,
            title: "챌린지 2 앱 개발",
            description: "챌린지 2 앱을 구현하기",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 7))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 25))!,
            isPublic: true,
            subGoals: [
                SubGoal(title: "View 구현하기", isCompleted: true),
                SubGoal(title: "Data Modeling", isCompleted: true),
                SubGoal(title: "CRUD 기능 구현하기", isCompleted: true),
            ]
        ),
        ProgressGoal(
            userId: mockUserList[2].id,
            title: "매일 새벽 수영",
            description: "매일 새벽 6시에 수영가기",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 1))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!,
            isPublic: true,
            currentProgress: 6,
            endProgress: 30,
            goalLabel: "회"
        ),
        SingleGoalGoal(
            userId: mockUserList[3].id,
            title: "에어 꼬시기",
            description: "에어를 관찰하여 꼬시기",
            createdAt: Date(),
            updatedAt: Date(),
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 18))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 18))!,
            isPublic: true,
            isCompleted: false
        )
    ]
    
    static let shared = MockGoalService()
    
    func fetchGoalsByUser(userId: UUID) async throws -> [Goal] {
        let goals: [Goal] = self.goals.filter { $0.userId == userId }
        return goals
    }

    func createGoal(_ goal: Goal) async throws -> Goal {
        self.goals.append(goal)
        return goal
    }

    func updateGoal(_ goal: Goal) async throws -> Goal {
//        if let index = self.goals.firstIndex(of: goal) {
//            self.goals[index] = goal
//        }
        for (index, g) in self.goals.enumerated() where g.id == goal.id {
            self.goals[index] = goal
        }
        return goal
    }

    func deleteGoal(id: UUID) async throws {
//        if let index = self.goals.firstIndex(of: goals.first(where: { $0.id == id })!) {
//            self.goals.remove(at: index)
//        }
        for (index, g) in self.goals.enumerated() where g.id == id {
            self.goals.remove(at: index)
        }
    }
}
