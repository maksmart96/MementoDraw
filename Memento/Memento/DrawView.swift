//
//  DrawView.swift
//  Memento
//
//  Created by  Максим Мартынов on 05.06.2022.
//

import Foundation
import UIKit

class DrawView: UIView {
    var carrierState: CarrierState!
    var lineWidth: CGFloat!
    var lineColor: UIColor!
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var path: UIBezierPath!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        lineWidth = 10
        let lines = LinesManager.shared
        carrierState = CarrierState(manager: lines)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        startPoint = touch.location(in: self)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        endPoint = touch.location(in: self)
        let line = LinesModel(start: startPoint, end: endPoint, color: lineColor)
        carrierState.linesManager.linesArray.append(line)
        
        path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        startPoint = endPoint
        printLines()
//        carrierState.linesManager.printLines(with: self)
    }
    
    func printLines() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor  = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
}
