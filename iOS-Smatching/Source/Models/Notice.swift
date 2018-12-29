//
//  Notice.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Notice : Mappable {
    var noticeIdx : Int?
    var title : String?
    var institution : String?
    var dday : Int?
    var scrap : Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        noticeIdx <- map["noticeIdx"]
        title <- map["title"]
        institution <- map["institution"]
        dday <- map["dday"]
        scrap <- map["scrap"] 
    }
    
}
