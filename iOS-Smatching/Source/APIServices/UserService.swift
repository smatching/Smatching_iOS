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
        "Content-Type" : "multipart/form-data"
    ]
    
    func signUp(email: String, password: String, name: String, profile: UIImage, completion: @escaping() -> Void) {
        
        Alamofire.upload(multipartFormData: {(multipart) in
            multipart.append(email.data(using: .utf8)!, withName: "email")
            multipart.append(password.data(using: .utf8)!, withName: "password")
            multipart.append(name.data(using: .utf8)!, withName: "name")
            multipart.append(profile.jpegData(compressionQuality: 0.5)!, withName: "profile", fileName: "profile.jpeg", mimeType: "image/jpeg")
        }, to: signupURL,
           headers: headers) { (result) in
            
            //멀티파트로 성공적으로 인코딩 되었다면 success, 아니라면 failure 입니다.
            switch result {
            case .success(let upload, _, _):
                
                // 성공 하였다면 아래의 과정으로 응답 리스폰스에 대한 처리를 합니다.
                // 여기부터는 request 함수와 동일합니다.
                upload.responseObject { (res: DataResponse<ResponseArray<User>>) in
                    switch res.result {
                    case .success:
                        print(res)
                        completion()
                    case .failure(let err):
                        print(err)
                    }
                }
                
            case .failure(let err):
                print(err)
            }
        }
    }
}
