//
//  UserService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 15..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire

struct UserService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<User>
    static let shared = UserService()
    let signupURL = url("/users")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    func signUp(nickname: String, email: String, password: String, completion: @escaping() -> Void) {
        
        let body = [
            "nickname" : nickname,
            "email" : email,
            "password" : password,
            ]
        postable(signupURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                completion()
            case .error(let error):
                print(error)
            }
        }
    }
}
