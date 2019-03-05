//
//  Extension.swift
//  ApexLegends
//
//  Created by Euijae Hong on 05/03/2019.
//  Copyright © 2019 엄태형. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
