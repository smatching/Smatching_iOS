//
//  Age.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Age : Mappable {
    var forty_more : Bool?
    var twenty_less : Bool?
    var twenty_forty : Bool?
    
    init(twenty_less:Bool, twenty_forty:Bool, forty_more : Bool) {
        self.twenty_less = twenty_less
        self.twenty_forty = twenty_forty
        self.forty_more = forty_more
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        forty_more <- map["forty_more"]
        twenty_less <- map["twenty_less"]
        twenty_forty <- map["twenty_forty"]
    }
}
