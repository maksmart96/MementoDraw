//
//  LinesManager.swift
//  Memento
//
//  Created by  Максим Мартынов on 05.06.2022.
//

import Foundation
import UIKit

class LinesManager {

    static let shared = LinesManager()
    
    var linesArray = [LinesModel]()
    
    func save() -> StateLinesMemento {
        return StateLinesMemento(lines: self.linesArray)
    }
    
    func load(state: StateLinesMemento) {
        self.linesArray = state.linesArray
    }
    
    func printLines(with view: UIView) {
        guard let layers = view.layer.sublayers else {
            for line in linesArray {
                let path = UIBezierPath()
                path.move(to: line.start)
                path.addLine(to: line.end)
                drawShapeLayer(path, line.color, view)
            }
            return
        }
        for layer in layers {
            layer.removeFromSuperlayer()
        }
        
        for line in linesArray {
            let path = UIBezierPath()
            path.move(to: line.start)
            path.addLine(to: line.end)
            drawShapeLayer(path, line.color, view)
        }
    }
    
    private func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor  = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)
        view.setNeedsDisplay()
    }
}
