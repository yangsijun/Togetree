//
//  UserSearchViewModel.swift
//  Togetree
//
//  Created by 양시준 on 4/23/25.
//

import SwiftUI

@MainActor
@Observable class UserSearchViewModel {
    var userList: [User] = []
    var errorMessage: String?
    
//    private let service: UserService = UserService()
    private let service: MockUserService = MockUserService()
    
    func searchUsers(by searchText: String) async throws {
        do {
            userList = try await service.searchUsers(by: searchText)
        } catch {
            userList = []
            errorMessage = "Failed to search User: \(error.localizedDescription)"
        }
    }
}
