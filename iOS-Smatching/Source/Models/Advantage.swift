//
//  Advantage.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Advantage: Mappable {
    var sole : Bool?
    var univ : Bool?
    var woman : Bool?
    var social : Bool?
    var disabled : Bool?
    var togather : Bool?
    var fourth : Bool?
    var retry : Bool?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        sole <- map["sole"]
        univ <- map["univ"]
        woman <- map["woman"]
        social <- map["social"]
        disabled <- map["disabled"]
        togather <- map["togather"]
        fourth <- map["fourth"]
        retry <- map["retry"]
        
    }
}
