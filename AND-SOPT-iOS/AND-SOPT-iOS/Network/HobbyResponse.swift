//
//  HobbyResponse.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/8/24.
//

import Foundation

struct HobbyResponse: Codable {
    let result: Hobby
}

struct Hobby: Codable {
    let hobby: String
}
