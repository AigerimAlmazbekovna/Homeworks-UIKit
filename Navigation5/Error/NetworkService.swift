//
//  Networkservice.swift
//  Navigation5
//
//  Created by Айгерим on 24.08.2024.
//

import Foundation
import UIKit

typealias ImageResult = Result<UIImage, ApiError>

let urlStringGlobal = "https://yandex.ru"

final class NetworkService {

    func getPhoto(stringUrl: String) throws -> UIImage {
        if stringUrl == urlStringGlobal {
            print("Done")
            return UIImage()
        } else if stringUrl == "https" {
            throw ApiError.badRequest
        } else if stringUrl == "" {
            throw ApiError.notFound
        } else {
            throw ApiError.unowned
        }
    }
    
    func getNetworkRequest(stringUrl: String, completion: @escaping (ImageResult) -> Void) {

        // делаем запрос и удаляем все из функции !!!
        // completion - ожидает -> возвращает при получении ответа с бэка


        if stringUrl == urlStringGlobal {
            print("Good")
            completion(.success(UIImage()))
        } else if stringUrl == "https" {
            completion(.failure(.badRequest))
        } else if stringUrl == "" {
            completion(.failure(.notFound))
        } else {
            completion(.failure(.unowned))
        }
        


    }
}
