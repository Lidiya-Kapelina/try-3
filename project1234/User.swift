//
//  User.swift
//  project1234
//
//  Created by Лидия  on 08.07.2024.
class User {
    static let shared = User()
    private init() {}

    var login: String?
    var password: String?
}
