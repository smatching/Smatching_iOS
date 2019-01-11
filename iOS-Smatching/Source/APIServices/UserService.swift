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
    typealias NetworkData = ResponseArray<Notification>
    typealias NetworkDataObj = ResponseObject<ConditionResponse>
    static let shared = UserService()
    let signupURL = url("/users")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    //회원가입
    func signUp(nickname: String, email: String, password: String, completion: @escaping() -> Void) {
        
        let body = [
            "nickname" : nickname,
            "email" : email,
            "password" : password
            ]
        postableObj(signupURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                print(value)
                completion()
            case .error(let error):
                print(error)
            }
        }
    }
    
    //홈탭 유저의 맞춤조건 현황 조회
    func getUserCondition(completion : @escaping(ConditionResponse) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
        ]
        let getURL = signupURL + "/cond"
        gettableObj(getURL, body: nil, header: headers) {(res)in
            switch res {
            case .success(let value):
                print(value)
                guard let conditionList = value.data else {return}
                completion(conditionList)
            case .error(let error):
                print(error)
            }
        }
    }
    //회원 프로필 사진 변경
    func putUserProfilImg(picture : UIImage, completion: @escaping() -> Void) {
        let putURL = signupURL + "/picture"
        
        let headers: HTTPHeaders = [
            "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
        ]
        
        Alamofire.upload(multipartFormData: { (multipart) in
            multipart.append(picture.jpegData(compressionQuality: 0.5)!, withName: "picture", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, to: putURL, method: .put,
           headers: headers) { (result) in
            
            //멀티파트로 성공적으로 인코딩 되었다면 success, 아니라면 failure 입니다.
            switch result {
            case .success(let upload, _, _):
                
                // 성공 하였다면 아래의 과정으로 응답 리스폰스에 대한 처리를 합니다.
                // 여기부터는 request 함수와 동일합니다.
                upload.responseObject { (res: DataResponse<ResponseArray<CommonResponse>>) in
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
    //회원 정보 변경
    func editUsersInfo(nickname : String, password: String, newPassword : String, completion : @escaping() -> Void) {
        let putURL = signupURL + "/edit"
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
        ]
        let body = [
            "nickname" : nickname,
            "password" : password,
            "newPassword" : newPassword
        ]
        
        puttable(putURL, body: body, header: headers){(res)in
            switch res {
            case .success(let value):
                print(value)
                completion()
            case .error(let error):
                print(error)
            }
        }
    }
    func leaveThisAppCompletely(completion: @escaping() -> Void) {
        let headers: HTTPHeaders = [
            "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
        ]
        
        deletable(signupURL, body: nil, header: headers) { (res) in
            switch res {
            case .success(let value):
                print(value)
                completion()
            case .error(let error):
                print(error)
            
            }
            
        }
        
    }
    func getNotifications(completion: @escaping([Notification]) ->Void) {
        let getURL = signupURL + "/notification"
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
        ]
        
        gettable(getURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                print(value)
                guard let notification = value.data else {return}
                completion(notification)
            case .error(let error):
                print(error)
                
            }
            
        }
        
    }
    
    //프로필 사진 삭제
    func deleteProfileImg(completion: @escaping() -> Void) {
        let deleteURL = signupURL + "/picture"
        
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
        ]
        
        puttable(deleteURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                print(value)
                completion()
            case .error(let error):
                print(error)
                
            }
            
        }
    }
}
