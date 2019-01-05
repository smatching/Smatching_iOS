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
    
    init(jeonbuk : Bool, gangwon : Bool,gwangju : Bool,ulsan : Bool,kyungbuk : Bool,sejong : Bool,chungbuk : Bool,kyungnam : Bool,seoul : Bool,chungnam : Bool,daejeon : Bool,busan : Bool,jeju : Bool,daegu : Bool,aborad : Bool,kyunggi : Bool,incheon : Bool, jeonnam: Bool) {
        self.jeonbuk = jeonbuk
        self.gangwon = gangwon
        self.gwangju = gwangju
        self.ulsan = ulsan
        self.kyungbuk = kyungbuk
        self.seoul = seoul
        self.chungnam = chungnam
        self.daejeon = daejeon
        self.busan = busan
        self.jeju = jeju
        self.daegu = daegu
        self.aborad = aborad
        self.kyunggi = kyunggi
        self.incheon = incheon
        self.jeonnam = jeonnam
        self.sejong = sejong
        self.chungbuk = chungbuk
        self.kyungnam = kyungnam
        
    }
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
