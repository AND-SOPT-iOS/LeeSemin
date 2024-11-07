//
//  SignUpRequest.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/2/24.
//

import Foundation

struct SignUpRequest: Codable {
    let username: String
    let password: String
    let hobby: String
}
