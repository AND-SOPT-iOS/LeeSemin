//
//  LoginResponse.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/8/24.
//

import Foundation

struct LoginResponse: Codable {
    let result: Token
}

struct Token: Codable {
    let token: String
}
