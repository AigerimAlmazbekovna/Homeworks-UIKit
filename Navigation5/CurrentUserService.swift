//
//  CurrentUserService.swift
//  Navigation5
//
//  Created by Айгерим on 21.04.2024.
//

import Foundation
import UIKit

class CurrentUserService: UserService {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func giveUser(name: String) -> User? {
        if user.fullName == name {
            return user
        } else {
            return nil
        }
    }
}
