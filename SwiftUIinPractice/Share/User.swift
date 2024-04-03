//
//  User.swift
//  SwiftUIinPractice
//
//  Created by Felipe Weber on 03/04/24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
    let domain, ip: String
    let macAddress, university: String
    let ein, ssn, userAgent: String
}
