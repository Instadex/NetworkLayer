//
//  Result.swift
//  NetworkLayer
//
//  Created by Bharat malhotra on 23/08/18.
//  Copyright © 2018 Bharat malhotra. All rights reserved.
//

import Foundation
enum Result<T, U> where U: Error{
    case success(T)
    case failure(U)
}
