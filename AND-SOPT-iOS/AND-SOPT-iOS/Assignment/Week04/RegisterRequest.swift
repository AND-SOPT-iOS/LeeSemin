//
//  RegisterRequest.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/2/24.
//

import Foundation

/// 유저 등록 API
/// 각 프로퍼티는 8자 이하여야 함
struct RegisterRequest: Codable {
    let username: String
    let password: String
    let hobby: String
}
