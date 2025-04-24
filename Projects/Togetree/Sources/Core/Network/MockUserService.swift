//
//  MockUserService.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation
import SwiftCSV

var mockUserList: [User] = [
    User(id: UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee0")!, name: "Air", profileImageUrl: "https://image.sijun.dev/api/images/view/Air.png", statusMessage: "200 OK"),
    User(id: UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1")!, name: "Ella", profileImageUrl: "https://image.sijun.dev/api/images/view/Ella.png", statusMessage: "노는 게 제일 좋아"),
    User(id: UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee2")!, name: "Mingky", profileImageUrl: "https://image.sijun.dev/api/images/view/Mingky.png", statusMessage: "밍기적..."),
    User(id: UUID(uuidString: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee3")!, name: "Moo", profileImageUrl: "https://image.sijun.dev/api/images/view/Moo.png", statusMessage: "무 무 무 🐄")
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
    
    func searchUsers(by keyword: String) async throws -> [User] {
        return mockUserList.filter({ $0.name.contains(keyword) })
    }
    
    
    
    
    static func loadMockUsersFromCSV(filename: String) /*-> [User] */{
//        guard let path = Bundle.main.path(forResource: "MockUsers", ofType: "csv") else {
//            print("CSV 파일을 찾을 수 없습니다.")
//            return nil
//        }
//        
//        guard let data = try? String(contentsOfFile: path, encoding: .utf8) else { return nil }
//
//        let lines = data.components(separatedBy: .newlines).filter { !$0.isEmpty }
//        guard lines.count > 1 else { return nil }
//
//        var users: [User] = []
//        for line in lines.dropFirst() { // 첫 줄은 헤더니까 스킵
//            let values = line.components(separatedBy: ",")
//            if values.count == 3 {
//                let user = User(name: values[0], profileImageUrl: values[1], statusMessage: values[2])
//                users.append(user)
//                print(user)
//            }
//        }
//        
//        return users
        
//        var users: [User] = []
                    
        guard let filePath = Bundle.main.path(forResource: filename, ofType: "csv") else {
            print("CSV file not found.")
            return
        }

        do {
            let csv = try CSV<Named>(url: URL(fileURLWithPath: filePath))
            
            let rows = csv.rows // [["id": "1", "name": "twok", "age": "18"], ["id": "2", "name": "투케이", "age": "19"]]
            
            for row in rows {
                let name = row["name"]!
                if ["Air", "Ella", "Mingky", "Moo"].contains(name) {
                    continue
                }
                let profileImageUrl = row["profileImageUrl"]!
                let statusMessage = row["statusMessage"] ?? ""
                
                mockUserList.append(User(name: name, profileImageUrl: profileImageUrl, statusMessage: statusMessage))
            }
        } catch {
            print("Error parsing CSV: \(error)")
            return
        }
    }
}
