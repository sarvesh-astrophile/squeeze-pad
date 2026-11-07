//
//  Item.swift
//  SqueezePad
//
//  Created by FCI on 07/11/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
