//
//  CarryerState.swift
//  Memento
//
//  Created by  Максим Мартынов on 05.06.2022.
//

import Foundation

class CarrierState {
    var state: StateLinesMemento?
    
    var linesManager: LinesManager
    
    init(manager: LinesManager) {
        self.linesManager = manager
    }
    
    func save() {
       state = linesManager.save()
    }
    
    func load() {
        guard let state = state else {
            return
        }
        linesManager.load(state: state)
        
    }
    
    
}
