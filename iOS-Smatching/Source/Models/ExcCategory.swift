//
//  ExcCategory.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct ExcCategory: Mappable {
    var loan : Bool?
    var edu : Bool?
    var know : Bool?
    var global : Bool?
    var place : Bool?
    var make : Bool?
    var local : Bool?
    var gov : Bool?
    
    init(loan : Bool, edu : Bool, know : Bool, global : Bool, place : Bool, make : Bool, local : Bool, gov : Bool) {
        self.loan = loan
        self.edu = edu
        self.know = know
        self.global = global
        self.place = place
        self.make = make
        self.local = local
        self.gov = gov
    }
    
    init?(map: Map) {
    }
    
    func getExcCategoryDic(excCategory: ExcCategory) -> [String: Bool] {
        var body = [String: Bool]()
        body.updateValue(excCategory.loan!, forKey: "loan")
        body.updateValue(excCategory.global!, forKey: "global")
        body.updateValue(excCategory.edu!, forKey: "edu")
        body.updateValue(excCategory.know!, forKey: "know")
        body.updateValue(excCategory.place!, forKey: "place")
        body.updateValue(excCategory.make!, forKey: "make")
        body.updateValue(excCategory.local!, forKey: "local")
        body.updateValue(excCategory.gov!, forKey: "gov")
        return body
        
    }
    
    mutating func mapping(map: Map) {
        loan <- map["loan"]
        edu <- map["edu"]
        know <- map["know"]
        global <- map["global"]
        place <- map["place"]
        make <- map["make"]
        local <- map["local"]
        gov <- map["gov"]
    }
}
