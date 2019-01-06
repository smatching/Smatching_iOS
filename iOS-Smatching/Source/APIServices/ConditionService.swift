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

struct ConditionService : APIManager, Requestable {
    typealias NetworkData = ResponseArray<CommonResponse>
    typealias NetworkDataObj = ResponseObject<CommonResponse>
    static let shared = ConditionService()
    var conditionURL = url("/user/cond")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
        ]
    
        //맞춤조건 알람 ON OFF
        func putAlarmSetting(condIdx : Int ,completion : @escaping(CommonResponse) -> Void) {
    
            let headers: HTTPHeaders = [
                "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "",
                "Client" : "iOS"
            ]
    
            let queryURL = conditionURL + "/alert?condIdx=\(condIdx)"
    
            puttable(queryURL, body: nil, header: headers){(res) in
                switch res {
                case .success(let value):
                    guard let isAlarm = value.data else {return}
                    completion(isAlarm)
                case .error(let error):
                    print(error)
                }
            }
        }
    
}
