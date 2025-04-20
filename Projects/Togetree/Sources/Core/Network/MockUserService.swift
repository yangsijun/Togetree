//
//  MockUserService.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation

var mockUserList: [User] = [
    User(id: UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee0")!, name: "Air", profileImageUrl: "https://picsum.photos/200/300", statusMessage: "Proverbs 3:5-6"),
    User(id: UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1")!, name: "Ella", profileImageUrl: "https://picsum.photos/200/301", statusMessage: "Hello, World!"),
    User(id: UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee2")!, name: "Mingky", profileImageUrl: "https://picsum.photos/200/302", statusMessage: "밍기적..."),
    User(id: UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee3")!, name: "Moo", profileImageUrl: "https://picsum.photos/200/303", statusMessage: "안녕")
]

class MockUserService {
    // TODO: API URL
//    let baseURL = URL(string: "")!

    func fetchUser(id: UUID) async throws -> User {
        return mockUserList.first(where: { $0.id == id })!
    }

    func loadFollowings(of userId: UUID) async throws -> [User] {
        return mockUserList
    }

    func loadFollowers(of userId: UUID) async throws -> [User] {
        return mockUserList
    }
}
