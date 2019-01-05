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
    
    init(a:Bool, b:Bool, c : Bool, d:Bool, e:Bool,f:Bool,g:Bool,h:Bool,i:Bool,j:Bool,k:Bool,l:Bool,m:Bool,n:Bool,o:Bool,p:Bool,q:Bool,r:Bool,s:Bool,t:Bool,u:Bool,v:Bool ) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
        self.h = h
        self.i = i
        self.j = j
        self.k = k
        self.l = l
        self.m = m
        self.n = n
        self.o = o
        self.p = p
        self.q = q
        self.r = r
        self.s = s
        self.t = t
        self.u = u
        self.v = v
        
    }
    
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
