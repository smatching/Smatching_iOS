//
//  Condition.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 29..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Condition: Mappable {
    var condIdx : Int?
    var condName : String?
    var noticeCnt : Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        condIdx <- map["condIdx"]
        condName <- map["condName"]
        noticeCnt <- map["noticeCnt"]
        
    }
}
