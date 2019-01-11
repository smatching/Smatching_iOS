//
//  Notification.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 11..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Notification: Mappable {
    var notificationIdx : Int?
    var alertType : String?
    var message : String?
    var checked : Bool?
    var outputTime : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        notificationIdx <- map["notificationIdx"]
        alertType <- map["alertType"]
        message <- map["message"]
        checked <- map["checked"]
        outputTime <- map["outputTime"]
    }
}
