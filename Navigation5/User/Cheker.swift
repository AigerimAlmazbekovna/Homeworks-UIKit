//
//  Cheker.swift
//  Navigation5
//
//  Created by Айгерим on 25.04.2024.
//

import Foundation
import UIKit

final class Checker {
    
    let userLogin: String?
    var userPassword: String?
    
    var service: UserService
    static let shared = Checker()
    
    private init() {
#if DEBUG
        service = TestUserService()
#else
        service = CurrentUserService()
#endif
        userLogin = service.user.login
        userPassword = service.user.password
    }
    
    func check(login: String, password: String) -> Bool {
        return service.checkUser(login: login)?.password == password
    }
}

struct LoginInspector: LoginViewControllerDelegate {
    
    func check(login: String, password: String) -> User? {
        if Checker.shared.check(login: login, password: password) {
            return Checker.shared.service.checkUser(login: login)
        }
        return nil
    }
}
