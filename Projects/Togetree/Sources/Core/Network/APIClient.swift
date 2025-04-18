//
//  APIClient.swift
//  Togetree
//
//  Created by 양시준 on 4/18/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case serverError(statusCode: Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidResponse: return "Invalid Response"
        case .decodingFailed: return "Decoding Failed"
        case .serverError(let code): return "Server Error: \(code)"
        }
    }
}

class APIClient {
    // MARK: - GET
    static func get<T: Decodable>(_ url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        try validate(response)
        return try decode(data)
    }
    
    // MARK: - POST
    static func post<T: Codable, R: Decodable>(_ url: URL, body: T) async throws -> R {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        try validate(response)
        return try decode(data)
    }
    
    // MARK: - PUT
    static func put<T: Codable, R: Decodable>(_ url: URL, body: T) async throws -> R {
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        try validate(response)
        return try decode(data)
    }
    
    // MARK: - DELETE
    static func delete(_ url: URL) async throws {
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        try validate(response)
    }

    // MARK: - Common Utilities
    private static func validate(_ response: URLResponse) throws {
        guard let http = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard (200..<300).contains(http.statusCode) else {
            throw APIError.serverError(statusCode: http.statusCode)
        }
    }
    
    private static func encode<T: Encodable>(_ value: T) throws -> Data {
        do {
            return try JSONEncoder().encode(value)
        } catch {
            print("Encoding failed: \(error.localizedDescription)")
            throw APIError.decodingFailed
        }
    }

    private static func decode<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Decoding failed: \(error.localizedDescription)")
            throw APIError.decodingFailed
        }
    }
}
