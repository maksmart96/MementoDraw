//
//  ViewController.swift
//  Memento
//
//  Created by  Максим Мартынов on 05.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var carrier: CarrierState!
    @IBOutlet weak var viewBoard: DrawView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBoard.lineColor = UIColor.black
        
        let linesManager = LinesManager.shared
        carrier = CarrierState(manager: linesManager)
    }

    @IBAction func resetAction(_ sender: Any) {
        guard let sublayers = viewBoard.layer.sublayers else { return }
        for sublayer in sublayers {
            sublayer.removeFromSuperlayer()
        }
        carrier.linesManager.linesArray.removeAll()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        carrier.save()
    }
    
    @IBAction func backAction(_ sender: Any) {
        carrier.load()
        carrier.linesManager.printLines(with: viewBoard)
    }
    
    @IBAction func chooseBlueAction(_ sender: Any) {
        viewBoard.lineColor = .blue
    }
    
    @IBAction func chooseOrangeAction(_ sender: Any) {
        viewBoard.lineColor = .orange
    }
    
    @IBAction func chooseGreenAction(_ sender: Any) {
        viewBoard.lineColor = .green
    }
}

