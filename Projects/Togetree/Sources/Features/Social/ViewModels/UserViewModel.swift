////
////  UserViewModel.swift
////  Togetree
////
////  Created by 양시준 on 4/18/25.
////
//
//import Foundation
//
//@MainActor
//class UserViewModel: ObservableObject {
//    @Published var user: User?
//    @Published var followings: [User] = []
//    @Published var followers: [User] = []
//    @Published var errorMessage: String?
//    
////    private let service: UserService = UserService()
//    private let service: MockUserService = MockUserService()
//    
//    func loadUser(with id: UUID) async throws {
//        do {
//            user = try await service.fetchUser(id: id)
//            try await loadFollowings()
//            try await loadFollowers()
//        } catch {
//            errorMessage = "Failed to load User: \(error.localizedDescription)"
//        }
//    }
//    
//    func loadFollowings() async throws {
//        do {
//            followings = try await service.loadFollowings(of: user!.id)
//        } catch {
//            errorMessage = "Failed to load Followings: \(error.localizedDescription)"
//        }
//    }
//    
//    func loadFollowers() async throws {
//        do {
//            followers = try await service.loadFollowers(of: user!.id)
//        } catch {
//            errorMessage = "Failed to load Followers: \(error.localizedDescription)"
//        }
//    }
//}
