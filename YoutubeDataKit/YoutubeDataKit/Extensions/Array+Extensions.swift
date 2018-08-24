//
//  Array+Extensions.swift
//  YoutubeDataKit
//
//  Created by Islam Qalandarov on 8/24/18.
//  Copyright © 2018 Qalandarov. All rights reserved.
//

import Foundation

extension Array where Element: RawRepresentable, Element.RawValue == String {
    func toCSV() -> String {
        return map { $0.rawValue }.joined(separator: ",")
    }
}
