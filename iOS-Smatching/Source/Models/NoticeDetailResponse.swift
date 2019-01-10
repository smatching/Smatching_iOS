//
//  NoticeDetailResponse.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 5..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct NoticeDetailResponse : Mappable {
    var noticeIdx : Int?
    var title : String?
    var institution : String?
    var part : String?
    var phone : String?
    var origin_url : String?
    var reg_date : String?
    var start_date : String?
    var summary : String?
    var target : String?
    var content : String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        noticeIdx <- map["noticeIdx"]
        title <- map["title"]
        institution <- map["institution"]
        part <- map["part"]
        phone <- map["phone"]
        reg_date <- map["reg_date"]
        start_date <- map["start_date"]
        summary <- map["summary"]
        target <- map["target"]
        content <- map["content"]
        origin_url <- map["origin_url"]
        
    }
}
