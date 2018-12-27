//
//  Main.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Main : Mappable {
    var allNoticeSummary : [Notice]?
    var nickname : String?
    var fitNoticeCnt : Int?
    var fitNoticeSummary : [Notice]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        allNoticeSummary <- map["allNoticeSummary"]
        nickname <- map["nickname"]
        fitNoticeCnt <- map["fitNoticeCnt"]
        fitNoticeSummary <- map["fitNoticeSummary"]
    }
}
