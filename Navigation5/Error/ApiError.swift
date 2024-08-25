//
//  ApiError.swift
//  Navigation5
//
//  Created by Айгерим on 24.08.2024.
//


import Foundation

enum ApiError: Error {
    case badRequest
    case notFound
    case unAuth
    case unowned
    case forbidden
}
