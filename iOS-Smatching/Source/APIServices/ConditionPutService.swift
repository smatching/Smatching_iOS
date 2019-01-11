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
    
    func postFitConditionInfo(condName : String, location: Location, age : Age, period : Period ,field : Field, advantage: Advantage, busiType : BusiType, excCategory : ExcCategory, completion: @escaping(CommonResponse) -> Void) {
    
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
                print(value)
                guard let condIdx = value.data else {return}
                completion(condIdx)
            case .error(let error):
                print(error)
            }
            
        }
    }
    func putFitConditionInfo(condIdx : Int, condName : String, location: Location, age : Age, period : Period ,field : Field, advantage: Advantage, busiType : BusiType, excCategory : ExcCategory, completion: @escaping(CommonResponse) -> Void) {
        let putURL = conditionURL + "/\(condIdx)"
        
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
        
        puttable(putURL, body: body, header: headers) {(res) in
            switch res {
            case .success(let value):
                print(value)
                guard let condIdx = value.data else {return}
                completion(condIdx)
            case .error(let error):
                print(error)
            }
            
        }
    }
    
    func deleteFitConditionInfo(cond_idx : Int, completion: @escaping()-> Void) {
        let deleteURL = conditionURL + "/\(cond_idx)"
        
        deletable(deleteURL, body: nil, header: headers) { (res) in
            switch res {
            case .success(let value):
                completion()
            case .error(let error):
                print(error)
            }
            
        }
    }
    func putAlarmSetting(condIdx : Int, completion : @escaping(CommonResponse)->Void ) {
        let putURL = conditionURL + "/alert/\(condIdx))"
        
        puttable(putURL, body: nil, header: headers){
            (res) in
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
