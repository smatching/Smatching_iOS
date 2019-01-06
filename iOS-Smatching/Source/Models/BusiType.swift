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
    
    init(sole : Bool, small : Bool,big : Bool,pre : Bool,midsmall : Bool,midbig : Bool,tradi : Bool ) {
        self.sole = sole
        self.small = small
        self.big = big
        self.pre = pre
        self.midsmall = midsmall
        self.midbig = midbig
        self.tradi = tradi
        
    }
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
