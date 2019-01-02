//
//  ExcCategory.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct ExcCategory: Mappable {
    var loan : Bool?
    var edu : Bool?
    var know : Bool?
    var global : Bool?
    var place : Bool?
    var make : Bool?
    var local : Bool?
    var gov : Bool?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        loan <- map["loan"]
        edu <- map["edu"]
        know <- map["know"]
        global <- map["global"]
        place <- map["place"]
        make <- map["make"]
        local <- map["local"]
        gov <- map["gov"]
    }
}
