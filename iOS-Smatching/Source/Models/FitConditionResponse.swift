//
//  FitConditionResponse.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 3..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct FitConditionResponse: Mappable {
    var condIdx : Int?
    var condName : String?
    var alert : Bool?
    var location: Location?
    var age : Age?
    var period : Period?
    var field : Field?
    var advantage : Advantage?
    var busiType : BusiType?
    var excCategory : ExcCategory?
    
    init(condName: String, location: Location, age : Age, period : Period, field: Field, advantage: Advantage, busiType: BusiType, excCategory: ExcCategory) {
        self.condName = condName
        self.location = location
        self.age = age
        self.period = period
        self.field = field
        self.advantage = advantage
        self.busiType = busiType
        self.excCategory = excCategory
        
    }
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        condIdx <- map["condIdx"]
        condName <- map["condName"]
        alert <- map["alert"]
        location <- map["location"]
        age <- map["age"]
        period <- map["period"]
        field <- map["field"]
        advantage <- map["advantage"]
        busiType <- map["busiType"]
        excCategory <- map["excCategory"]
        
    }
}
