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

var mockFollowingList: [UUID: [UUID]] = [
    UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee0")!: [
        UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1")!,
        UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee2")!,
        UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee3")!,
    ],
    UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1")!: [
        UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee0")!,
        UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee2")!,
    ],
    UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee2")!: [
        UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee0")!,
        UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1")!,
        UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee3")!,
    ],
    UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee3")!: [
        UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1")!,
    ],
]

class MockUserService {
    // TODO: API URL
//    let baseURL = URL(string: "")!

    func fetchUser(id: UUID) async throws -> User {
        return mockUserList.first(where: { $0.id == id })!
    }

    func loadFollowings(of userId: UUID) async throws -> [User] {
        let followingIds = mockFollowingList[userId] ?? []
        return mockUserList.filter({ followingIds.contains($0.id) })
    }

    func loadFollowers(of userId: UUID) async throws -> [User] {
        var result: [User] = []
        for (key, value) in mockFollowingList {
            if value.contains(userId) {
                if let user = mockUserList.first(where: { $0.id == key }) {
                    result.append(user)
                }
            }
        }
        return result
    }
    
    func createFollow(of followerId: UUID, to followeeId: UUID) async throws {
        if mockFollowingList[followerId] == nil {
            mockFollowingList[followerId] = []
        }
        mockFollowingList[followerId]?.append(followeeId)
    }
    
    func deleteFollow(of followerId: UUID, to followeeId: UUID) async throws {
        if var followingIds = mockFollowingList[followerId] {
            if let index = followingIds.firstIndex(of: followeeId) {
                followingIds.remove(at: index)
            }
            mockFollowingList[followerId] = followingIds
        }
    }
}
