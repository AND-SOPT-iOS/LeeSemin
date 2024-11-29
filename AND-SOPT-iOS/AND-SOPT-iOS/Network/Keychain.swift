//
//  Keychain.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/8/24.
//

import Foundation
import Security

class Keychain {
    static let shared = Keychain()
    
    func save(token: String, forKey key: String) {
        let tokenData = Data(token.utf8)
        
        // Keychain에 저장할 항목의 쿼리 설정 (기존 값 삭제를 위한 쿼리)
        let query = [
            kSecClass: kSecClassGenericPassword, // 항목 유형을 일반 비밀번호로 설정
            kSecAttrAccount: key // 저장할 때 사용할 고유 키 설정
        ] as CFDictionary
        
        // 기존에 같은 키 값이 있을 경우 삭제 (중복 저장 방지)
        SecItemDelete(query)
        
        // 실제로 저장할 데이터와 관련된 속성들을 설정 (토큰과 계정 정보를 포함)
        let attributes = [
            kSecClass: kSecClassGenericPassword, // 항목 유형 설정
            kSecAttrAccount: key, // 계정에 해당하는 키 설정
            kSecValueData: tokenData // 저장할 값 (Token)을 Data로 설정
        ] as CFDictionary
        
        // 설정된 속성들을 기반으로 Keychain에 새로운 항목을 추가
        SecItemAdd(attributes, nil)
    }
    
    func read(forKey key: String) -> String? {
        // Keychain에서 데이터를 읽어올 쿼리 설정
        let query = [
            kSecClass: kSecClassGenericPassword, // 항목 유형을 일반 비밀번호로 설정
            kSecAttrAccount: key, // 읽어올 항목의 고유 키
            kSecReturnData: true, // 데이터 값을 반환하도록 설정
            kSecMatchLimit: kSecMatchLimitOne // 중복되는 경우 하나의 값만 반환
        ] as CFDictionary
        
        // 결과를 저장할 변수
        var result: AnyObject?
        
        // 쿼리로 항목을 검색하고 결과를 result에 할당
        SecItemCopyMatching(query, &result)
        
        // 검색된 데이터가 Data 타입으로 변환 가능하면 문자열로 변환 후 반환
        guard let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
