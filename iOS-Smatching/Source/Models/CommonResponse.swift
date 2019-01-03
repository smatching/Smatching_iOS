//
//  CommonResponse.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 3..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct CommonResponse: Mappable {
    var num : Int?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        num <- map["num"]
    }
}
