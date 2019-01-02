//
//  ConditionSettingService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct ConditionSettingSerive : APIManager, Requestable {
    typealias NetworkDataObj = ResponseObject<ConditionResponse>
    typealias NetworkData = ResponseArray<ConditionResponse>
    static let shared = ConditionSettingSerive()
    var conditionURL = url("/conds")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") as! String
    ]
    
    
}
