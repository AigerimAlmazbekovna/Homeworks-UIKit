//
//  LoginViewControllerDelegate.swift
//  Navigation5
//
//  Created by Айгерим on 25.04.2024.
//

import Foundation
protocol LoginViewControllerDelegate {
    func check(login: String, password: String) -> User?
}
