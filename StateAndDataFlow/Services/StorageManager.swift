//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Aliaksandr Rauko on 22.02.22.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let userKey = "users"
    
    private init() {}
    
    func save(user: User) {
        var users = fetchUsers()
        users.append(user)
        
        guard let data = try? JSONEncoder().encode(users) else { return }
        userDefaults.set(data, forKey: userKey)
    }
    
    func fetchUsers() -> [User] {
        guard let data = userDefaults.object(forKey: userKey) as? Data else { return [] }
        guard let users = try? JSONDecoder().decode([User].self, from: data) else { return [] }
        
        return users
    }
    
    func deleteContact(at index: Int) {
        var users = fetchUsers()
        users.remove(at: index)
        
        guard let data = try? JSONEncoder().encode(users) else { return }
        userDefaults.set(data, forKey: userKey)
    }
}

