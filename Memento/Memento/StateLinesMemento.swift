//
//  LinesModelMemento.swift
//  Memento
//
//  Created by  Максим Мартынов on 05.06.2022.
//

import Foundation


class StateLinesMemento {
    var linesArray: [LinesModel]
    
    init(lines: [LinesModel]) {
        self.linesArray = lines
    }
}
