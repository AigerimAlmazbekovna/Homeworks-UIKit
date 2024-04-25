//
//  User.swift
//  Navigation5
//
//  Created by Айгерим on 25.04.2024.
//

import Foundation
import UIKit

public class User {
    
    var login: String
    var password: String
    var fullName: String
    var avatar: UIImage
    var status: String
    
    init(
        login: String,
        password: String,
        fullName: String,
        avatar: UIImage,
        status: String
    )
    {
        self.login = login
        self.password = password
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
    
}
