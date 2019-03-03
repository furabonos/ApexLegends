//
//  Result.swift
//  ApexLegends
//
//  Created by 엄태형 on 2019. 3. 2..
//  Copyright © 2019년 엄태형. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Data?, Error)
}

