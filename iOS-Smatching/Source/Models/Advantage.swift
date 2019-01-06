//
//  Advantage.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Advantage: Mappable {
    var sole : Bool?
    var univ : Bool?
    var woman : Bool?
    var social : Bool?
    var disabled : Bool?
    var togather : Bool?
    var fourth : Bool?
    var retry : Bool?
    
    init(sole:Bool, univ:Bool, woman : Bool, social : Bool, disabled : Bool, togather : Bool, fourth : Bool,retry : Bool) {
        self.sole = sole
        self.univ = univ
        self.woman = woman
        self.social = social
        self.disabled = disabled
        self.togather = togather
        self.fourth = fourth
        self.retry = retry
        
    }
    
    init?(map: Map) {
    }
    
    func getAdvantageDic(advantage: Advantage) -> [String: Bool] {
        var body = [String: Bool]()
        body.updateValue(advantage.sole!, forKey: "sole")
        body.updateValue(advantage.univ!, forKey: "univ")
        body.updateValue(advantage.woman!, forKey: "woman")
        body.updateValue(advantage.social!, forKey: "social")
        body.updateValue(advantage.disabled!, forKey: "disabled")
        body.updateValue(advantage.togather!, forKey: "togather")
        body.updateValue(advantage.fourth!, forKey: "fourth")
        body.updateValue(advantage.retry!, forKey: "retry")
        return body
    }
    
    mutating func mapping(map: Map) {
        sole <- map["sole"]
        univ <- map["univ"]
        woman <- map["woman"]
        social <- map["social"]
        disabled <- map["disabled"]
        togather <- map["togather"]
        fourth <- map["fourth"]
        retry <- map["retry"]
        
    }
}
