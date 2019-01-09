//
//  User.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 7..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct User : Mappable {
    var nickname : String?
    var profileUrl : String?
    var noticeScrapCnt : Int?
    var talkScrapCnt : Int?
    var email : String?
    var password : String?
    var newPassword : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        nickname <- map["nickname"]
        profileUrl <- map["profileUrl"]
        noticeScrapCnt <- map["noticeScrapCnt"]
        talkScrapCnt <- map["talkScrapCnt"]
        email <- map["email"]
        password <- map["password"]
        newPassword <- map["newPassword"]
    }
}
