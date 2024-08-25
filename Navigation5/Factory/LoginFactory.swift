//
//  LoginFactory.swift
//  Navigation5
//
//  Created by Айгерим on 25.04.2024.
//

import Foundation
import UIKit

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
   
