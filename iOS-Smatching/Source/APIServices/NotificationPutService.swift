//
//  ConditionService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 29..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct NotificationPutService : APIManager, Requestable {
    typealias NetworkData = ResponseArray<CommonResponse>
    typealias NetworkDataObj = ResponseObject<CommonResponse>
    static let shared = NotificationPutService()
    var notificationURL = url("/users")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
        ]
    
    func getNotificationCount(completion: @escaping(CommonResponse) -> Void) {
            let getURL = notificationURL + "/notification/unchecked"
        
        gettableObj(getURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                print(value)
                guard let result = value.data else {return}
                completion(result)
            case .error(let error):
                print(error)
            }
            
        }
    }
    
    
}
