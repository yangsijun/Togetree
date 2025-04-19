//
//  User.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import Foundation

public struct User: Codable, Identifiable, Equatable {
    public var id: UUID = UUID()
    public var name: String
    public var profileImageUrl: String? = nil
    public var statusMessage: String? = nil
}
