//
//  FeedModelTests.swift
//  Navigation5
//
//  Created by Айгерим on 23.10.2024.
//

import Foundation
import XCTest
@testable import Navigation5
final class FeedModelTests: XCTestCase {
    
    func testCheckCorrectWord() {
        // Данный секретное слово для теста
        let secretWord = "apple"
        let model = FeedModedl(secretWord: secretWord)
        
        var result: Bool?
        
        // Подписываемся на результат проверки
        model.onCheckResult = { isCorrect in
            result = isCorrect
        }
        
        // Проверяем правильное слово
        model.check("apple")
        
        // Убеждаемся, что результат проверки - true
        XCTAssertTrue(result == true, "Expected result to be true for correct word.")
    }
    
    func testCheckIncorrectWord() {
        // Данный секретное слово для теста
        let secretWord = "apple"
        let model = FeedModedl(secretWord: secretWord)
        
        var result: Bool?
        
        // Подписываемся на результат проверки
        model.onCheckResult = { isCorrect in
            result = isCorrect
        }
        
        // Проверяем неправильное слово
        model.check("banana")
        
        // Убеждаемся, что результат проверки - false
        XCTAssertTrue(result == false, "Expected result to be false for incorrect word.")
    }
    func testCheckWordWithSpaces() {
        let secretWord = "apple"
        let model = FeedModedl(secretWord: secretWord)
        
        var result: Bool?
        
        model.onCheckResult = { isCorrect in
            result = isCorrect
        }
        
        // Проверяем слово с пробелами
        model.check(" apple ") // С пробелами
        
        // Убеждаемся, что результат проверки - false
        XCTAssertTrue(result == false, "Expected result to be false for word with spaces.")
    }
    
}

