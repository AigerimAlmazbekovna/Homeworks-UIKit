//
//  TestUserService.swift
//  Navigation5
//
//  Created by Айгерим on 21.04.2024.
//

import Foundation
import UIKit

class TestUserService: UserService {
    
    private let user = User(login: "Aigerim Almazbekova", password: "12345", fullName: "Aigerim", avatar: UIImage(named: "dream1.png") ?? UIImage(), status: "Finding out happinest")
    
    func giveUser(name: String) -> User? {
            return user
    }
    
    
}
