//
//  UserViewModel.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import SwiftUI
import Foundation

@MainActor
@Observable class UserViewModel {
    var user: User?
    var followings: [User] = []
    var followers: [User] = []
    var errorMessage: String?
    
//    private let service: UserService = UserService()
    private let service: MockUserService = MockUserService()
    
    func loadUser(with id: UUID) async throws {
        do {
            user = try await service.fetchUser(id: id)
            try await loadFollowings()
            try await loadFollowers()
        } catch {
            errorMessage = "Failed to load User: \(error.localizedDescription)"
        }
    }
    
    func loadFollowings() async throws {
        do {
            followings = try await service.loadFollowings(of: user!.id)
        } catch {
            errorMessage = "Failed to load Followings: \(error.localizedDescription)"
        }
    }
    
    func loadFollowers() async throws {
        do {
            followers = try await service.loadFollowers(of: user!.id)
        } catch {
            errorMessage = "Failed to load Followers: \(error.localizedDescription)"
        }
    }
    
    func isFollowing(_ user: User) -> Bool {
        followings.contains(where: { $0.id == user.id })
    }
    
    func createFollow(to user: User) async throws {
        try await service.createFollow(of: self.user!.id, to: user.id)
        try await loadFollowings()
    }
    
    func deleteFollow(to user: User) async throws {
        try await service.deleteFollow(of: self.user!.id, to: user.id)
        try await loadFollowings()
    }
}
