//
//  ConditionPutService.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 5..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct ConditionPutService : APIManager, Requestable {
    typealias NetworkDataObj = ResponseObject<CommonResponse>
    typealias NetworkData = ResponseArray<FitConditionResponse>
    static let shared = ConditionPutService()
    var conditionURL = url("/conds")//url 상세주소
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") as! String,
         "Client" : "iOS"
    ]
    
    func putFitConditionInfo(condName : String, location: Location, age : Age, period : Period ,field : Field, advantage: Advantage, busiType : BusiType, excCategory : ExcCategory, completion: @escaping(CommonResponse) -> Void) {
        let body = [
            "condName" : condName,
            "location" : location,
            "age" : age,
            "period" : period,
            "field" : field,
            "advantage" : advantage,
            "busiType" : busiType,
            "excCategory" : excCategory
            ] as [String : Any]
        
        postableObj(conditionURL, body: body, header: headers) {(res) in
            switch res {
            case .success(let value):
                guard let condIdx = value.data else {return}
                completion(condIdx)
            case .error(let error):
                print(error)
            }
            
        }
    }
}
