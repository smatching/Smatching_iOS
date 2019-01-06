//
//  BusiType.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct BusiType: Mappable {
    var sole : Bool?
    var small : Bool?
    var big : Bool?
    var pre : Bool?
    var midsmall : Bool?
    var midbig : Bool?
    var tradi : Bool?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        sole <- map["sole"]
        small <- map["small"]
        big <- map["big"]
        pre <- map["pre"]
        midsmall <- map["midsmall"]
        midbig <- map["midbig"]
        tradi <- map["tradi"]
        
    }
    
}
