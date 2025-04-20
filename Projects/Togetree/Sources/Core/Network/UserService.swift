//
//  UserService.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation

//class UserService {
//    // TODO: API URL
//    let baseURL = URL(string: "")!
//    
//    func fetchUser(id: UUID) async throws -> User {
//        let url = baseURL.appendingPathComponent("users/\(id.uuidString)")
//        return try await APIClient.get(url)
//    }
//    
//    func loadFollowings(of userId: UUID) async throws -> [User] {
//        let url = baseURL.appendingPathComponent("users/\(userId.uuidString)/followings")
//        return try await APIClient.get(url)
//    }
//    
//    func loadFollowers(of userId: UUID) async throws -> [User] {
//        let url = baseURL.appendingPathComponent("users/\(userId.uuidString)/followers")
//        return try await APIClient.get(url)
//    }

//func loadFollowers(of userId: UUID) async throws -> [User] {
//    let url = baseUrl.appendingPathComponent("users/\(userId.uuidString)/followers")
//    return try await APIClient.get(url)
//}

//func createFollow(of followerId: UUID, to followeeId: UUID) async throws {
//    let url = baseUrl.appendingPathComponent("users/\(followerId.uuidString)/followings/\(followeeId.uuidString)")
//    try await APIClient.post(url)
//}

//func deleteFollow(of followerId: UUID, to followeeId: UUID) async throws {
//    let url = baseUrl.appendingPathComponent("users/\(followerId.uuidString)/followings/\(followeeId.uuidString)")
//    try await APIClient.delete(url)
//}
//}
