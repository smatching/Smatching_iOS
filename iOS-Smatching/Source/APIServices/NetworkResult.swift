//
//  NetworkResult.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 15..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

enum NetworkResult<T> {
    case success(T)
    case error(Error)
}
