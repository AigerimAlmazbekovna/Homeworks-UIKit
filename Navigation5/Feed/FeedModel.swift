//
//  FeedModel.swift
//  Navigation5
//
//  Created by Айгерим on 30.04.2024.
//

import Foundation
import UIKit

final class FeedModedl {
    
    // Обработчик для результата проверки слова
    var onCheckResult: ((Bool) -> Void)?
    
    private let secretWord: String
    
    init(secretWord: String) {
        self.secretWord = secretWord
    }
    
   func check(_ word: String) {
       let isCorrect = word == secretWord
        onCheckResult?(isCorrect)
   }
    

    
}
