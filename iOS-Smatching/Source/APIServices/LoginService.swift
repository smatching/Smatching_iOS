//
//  LoginService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 26..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire

struct LoginService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Token>
    static let shared = LoginService()
    let loginURL = url("/users/login")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
]

    func login(email: String, password: String, completion: @escaping(Token) -> Void) {
        
        let body = [
            "email" : email,
            "password" : password,
            ]
        postable(loginURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                print(value)
                guard let token = value.data else {return}
                completion(token)
            case .error(let error):
                print(error)
            }
        }
    }
}
