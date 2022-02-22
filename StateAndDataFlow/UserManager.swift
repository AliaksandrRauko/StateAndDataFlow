//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var isRegister = StorageManager.shared.fetchUsers().count > 0
    var name = StorageManager.shared.fetchUsers().first?.name ?? ""
    
}
