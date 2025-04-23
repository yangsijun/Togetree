//
//  UserService.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation

class UserService {
    // TODO: API URL
    let baseURL = URL(string: "")!
    
    func fetchUser(id: UUID) async throws -> User {
        let url = baseURL.appendingPathComponent("users/\(id.uuidString)")
        return try await APIClient.get(url)
    }
    
    func loadFollowings(of userId: UUID) async throws -> [User] {
        let url = baseURL.appendingPathComponent("users/\(userId.uuidString)/followings")
        return try await APIClient.get(url)
    }
    
    func loadFollowers(of userId: UUID) async throws -> [User] {
        let url = baseURL.appendingPathComponent("users/\(userId.uuidString)/followers")
        return try await APIClient.get(url)
    }

    func createFollow(of followerId: UUID, to followeeId: UUID) async throws -> Bool {
        struct FollowRequest: Codable {
            var followerId: UUID
            var followeeId: UUID
        }
        let url = baseURL.appendingPathComponent("users/\(followerId.uuidString)/followings/\(followeeId.uuidString)")
        return try await APIClient.post(url, body: FollowRequest(followerId: followerId, followeeId: followeeId))
    }

    func deleteFollow(of followerId: UUID, to followeeId: UUID) async throws {
        let url = baseURL.appendingPathComponent("users/\(followerId.uuidString)/followings/\(followeeId.uuidString)")
        try await APIClient.delete(url)
    }
    
    func searchUsers(by keyword: String) async throws -> [User] {
        return mockUserList.filter({ $0.name.contains(keyword) })
    }
}
