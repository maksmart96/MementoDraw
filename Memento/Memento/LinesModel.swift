//
//  LinesModel.swift
//  Memento
//
//  Created by  Максим Мартынов on 05.06.2022.
//

import Foundation
import UIKit

struct LinesModel {
    
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    init(start: CGPoint, end: CGPoint, color: UIColor) {
        self.color = color
        self.start = start
        self.end = end
    }
}
