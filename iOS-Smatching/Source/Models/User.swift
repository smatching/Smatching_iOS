//
//  User.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 15..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: Mappable {
    
    var nickname : String?

    init? (map: Map) {}

    mutating func mapping(map: Map) {
        nickname <- map["nickname"]
    }
}
