//
//  Location.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Location: Mappable {
    var jeonbuk : Bool?
    var gangwon : Bool?
    var gwangju : Bool?
    var ulsan : Bool?
    var kyungbuk : Bool?
    var sejong : Bool?
    var chungbuk : Bool?
    var kyungnam : Bool?
    var seoul : Bool?
    var chungnam : Bool?
    var daejeon : Bool?
    var busan : Bool?
    var jeju : Bool?
    var daegu : Bool?
    var aborad : Bool?
    var kyunggi : Bool?
    var incheon : Bool?
    var jeonnam : Bool?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        jeonbuk <- map["jeonbuk"]
        gangwon <- map["gangwon"]
        gwangju <- map["gwangju"]
        ulsan <- map["ulsan"]
        kyungbuk <- map["kyungbuk"]
        sejong <- map["sejong"]
        chungbuk <- map["chungbuk"]
        kyungnam <- map["kyungnam"]
        seoul <- map["seoul"]
        chungnam <- map["chungnam"]
        daejeon <- map["daejeon"]
        busan <- map["busan"]
        jeju <- map["jeju"]
        daegu <- map["daegu"]
        aborad <- map["aborad"]
        kyunggi <- map["kyunggi"]
        incheon <- map["incheon"]
        jeonnam <- map["incheon"]
        
    }
    
}
