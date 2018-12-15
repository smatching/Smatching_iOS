//
//  ResponseArray.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 15..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import ObjectMapper

struct ResponseArray<T: Mappable>: Mappable {
    
    var status: Int?
    var message: String?
    var data: [T]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }
}
