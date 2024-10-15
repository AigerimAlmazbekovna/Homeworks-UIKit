//
//  UserService.swift
//  Navigation5
//
//  Created by Айгерим on 25.04.2024.
//

import Foundation
import UIKit

protocol UserService {
    var user: User { get set }
    func checkUser(login: String) -> User?
}

extension UserService {
    func checkUser(login: String) -> User? {
        return login == user.login ? user : nil
    }
}

class CurrentUserService: UserService {
    
    var user = User(
        login: "Aigerim",
        password: "12345",
        fullName: "ala",
        avatar: UIImage(named: "dream1")!,
        status: "Online"
    )
    init() {
        self.user = User(
            login: "Aigerim",
            password: "12345",
            fullName: "ala",
            avatar: UIImage(named: "dream1")!,
            status: "Online"
        )
    }
}

class TestUserService: UserService {
    
    var user = User(
        login: "Test",
        password: "12345",
        fullName: "Test_User",
        avatar: UIImage(named: "dream1")!,
        status: "DEBUG"
    )
    init() {
        self.user = User(
            login: "Test",
            password: "12345",
            fullName: "Test_User",
            avatar: UIImage(named: "dream1")!,
            status: "DEBUG"
        )
    }
}
