//
//  Period.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Period : Mappable{
    var three_four : Bool?
    var six_seven : Bool?
    var one_two : Bool?
    var seven_more : Bool?
    var zero_one : Bool?
    var four_five : Bool?
    var yet : Bool?
    var two_three : Bool?
    var five_six : Bool?
    
    init(three_four : Bool, six_seven : Bool, one_two : Bool, seven_more : Bool, zero_one : Bool, four_five : Bool, yet : Bool, two_three : Bool, five_six : Bool) {
        self.three_four = three_four
        self.six_seven = six_seven
        self.one_two = one_two
        self.four_five = four_five
        self.yet = yet
        self.two_three = two_three
        self.five_six = five_six
        self.seven_more = seven_more
        self.zero_one = zero_one
        
    }
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        three_four <- map["three_four"]
        six_seven <- map["six_seven"]
        one_two <- map["one_two"]
        seven_more <- map["seven_more"]
        zero_one <- map["zero_one"]
        four_five <- map["four_five"]
        yet <- map["yet"]
        two_three <- map["two_three"]
        five_six <- map["five_six"]
        
    }
}
