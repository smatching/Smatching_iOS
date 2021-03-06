//
//  ConditionResponse.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 29..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct ConditionResponse: Mappable {
    var nickname : String?
    var condSummaryList: [Condition]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        nickname <- map["nickname"]
        condSummaryList <- map["condSummaryList"]
    }
    
    
    
}
