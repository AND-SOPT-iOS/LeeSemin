//
//  UserService.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/2/24.
//

import Foundation

import Alamofire

class UserService {
    
    func signUp(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        let url = Environment.baseURL + "/user"
        
        let parameters = SignUpRequest(
            username: username,
            password: password,
            hobby: hobby
        )
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                completion(.success(true))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func login(
        username: String,
        password: String,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        let url = Environment.baseURL + "/login"
        
        let parameters = LoginRequest(username: username, password: password)
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable(of: LoginResponse.self) { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success(let loginResponse):
                completion(.success(loginResponse.result.token))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func getMyHobby(token: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/user/my-hobby"
        
        let headers: HTTPHeaders = [
            "token": token
        ]
        
        AF.request(
            url,
            method: .get,
            headers: headers
        )
        .validate()
        .responseDecodable(of: HobbyResponse.self) { response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data
            else {
                completion(.failure(.unknownError))
                return
            }
            switch response.result {
            case .success(let hobbyResponse):
                completion(.success(hobbyResponse.result.hobby))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func getUserHobby(userNo: Int, token: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        let url = "\(Environment.baseURL)/user/\(userNo)/hobby"
        
        let headers: HTTPHeaders = [
            "token": token
        ]
        
        AF.request(
            url,
            method: .get,
            headers: headers
        )
        .validate()
        .responseDecodable(of: HobbyResponse.self) { response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data
            else {
                completion(.failure(.unknownError))
                return
            }
            switch response.result {
            case .success(let hobbyResponse):
                completion(.success(hobbyResponse.result.hobby))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func updateUserInfo(
        token: String,
        hobby: String,
        password: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        let url = Environment.baseURL + "/user"
        
        let parameters = UpdateRequest(hobby: hobby, password: password)
        
        let headers: HTTPHeaders = [
            "token": token
        ]
        
        AF.request(
            url,
            method: .put,
            parameters: parameters,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .validate()
        .response {[weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            print("Status Code: \(statusCode)")
            
            switch response.result {
            case .success:
                completion(.success(true))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (404, ""):
            return .invalidURL
        case (409, "00"):
            return .duplicateError
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
}
