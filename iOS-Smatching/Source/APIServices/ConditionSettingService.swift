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
    typealias NetworkDataObj = ResponseObject<FitConditionResponse>
    typealias NetworkData = ResponseArray<FitConditionResponse>
    static let shared = ConditionSettingSerive()
    var conditionURL = url("/conds")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
    ]
    
    func getFitConditionInfo(cond_idx : Int, completion: @escaping(FitConditionResponse) -> Void) {
        let queryURL = conditionURL + "?cond_idx=\(cond_idx)"
        
        gettableObj(queryURL, body: nil, header: headers) {(res) in
            switch res {
            case .success(let value):
                guard let conditionInfo = value.data else {return}
                completion(conditionInfo)
            case .error(let error):
                print(error)
            }
        }
    }
}
