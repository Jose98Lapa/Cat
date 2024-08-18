//
//  HTTPMethod.swift
//  Gatinhos
//
//  Created by José Miguel Lapa on 17/08/2024.
//


import Foundation

enum HTTPMethod: String {
    case POST, GET, PUT, DELETE
}

enum HTTPBodyConfiguration {
    static let JSON = "application/json; charset=utf-8"
}
