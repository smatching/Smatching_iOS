//
//  Views.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Field : Mappable{
    var a : Bool?
    var b : Bool?
    var c : Bool?
    var d : Bool?
    var e : Bool?
    var f : Bool?
    var g : Bool?
    var h : Bool?
    var i : Bool?
    var j : Bool?
    var k : Bool?
    var l : Bool?
    var m : Bool?
    var n : Bool?
    var o : Bool?
    var p : Bool?
    var q : Bool?
    var r : Bool?
    var s : Bool?
    var t : Bool?
    var u : Bool?
    var v : Bool?
    
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        a <- map["a"]
        b <- map["b"]
        c <- map["c"]
        d <- map["d"]
        e <- map["e"]
        f <- map["f"]
        g <- map["g"]
        h <- map["h"]
        i <- map["i"]
        j <- map["j"]
        k <- map["k"]
        l <- map["l"]
        m <- map["m"]
        n <- map["n"]
        o <- map["o"]
        p <- map["p"]
        q <- map["q"]
        r <- map["r"]
        s <- map["s"]
        t <- map["t"]
        u <- map["u"]
        v <- map["v"]
        
    }
}
