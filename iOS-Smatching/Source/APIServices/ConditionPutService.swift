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
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "",
        "Client" : "iOS"
    ]
    
    func putFitConditionInfo(condName : String, location: Location, age : Age, period : Period ,field : Field, advantage: Advantage, busiType : BusiType, excCategory : ExcCategory, completion: @escaping(CommonResponse) -> Void) {
        //       let body = FitConditionResponse(condName: condName, location: location, age: age, period: period, field: field, advantage: advantage, busiType: busiType, excCategory: excCategory) as [String : Any]
        let body: [String : Any] = [
            "condName" : condName,
            "location" : location.getLocationDic(location: location),
            "age" : age.getAgeDic(age: age),
            "period" : period.getPeriodDic(period : period),
            "field" : field.getFieldDic(field : field),
            "advantage" : advantage.getAdvantageDic(advantage: advantage),
            "busiType" : busiType.getBusiTypeDic(busiType : busiType),
            "excCategory" : excCategory.getExcCategoryDic(excCategory: excCategory)
        ]
        
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
