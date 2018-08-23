//
//  HTTPMethod.swift
//  NetworkLayer
//
//  Created by Bharat malhotra on 23/08/18.
//  Copyright © 2018 Bharat malhotra. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String:String]

enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
}

