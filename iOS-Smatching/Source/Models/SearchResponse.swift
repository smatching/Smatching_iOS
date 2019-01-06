//
//  SearchResponse.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 5..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct SearchResponse : Mappable {
    var notices : [Notice]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        notices <- map["notices"]
    }
}
