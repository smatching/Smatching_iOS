//
//  BaseResponse.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 6..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import ObjectMapper

struct BaseResponse : Mappable{
    
    var status: Int?
    var message: String?
    var data : String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }
}
