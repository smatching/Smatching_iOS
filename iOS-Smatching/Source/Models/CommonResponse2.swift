//
//  CommonResponse2.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 3..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct CommonResponse2: Mappable {
    var result : Bool?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
    }
}
