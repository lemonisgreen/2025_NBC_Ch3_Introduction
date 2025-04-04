//
//  ViewController.swift
//  CalculatorAppOfStoryboard
//
//  Created by 최규현 on 3/26/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numLabel: UILabel!
    
    var textValue = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        numLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        
        addNumber(title)
    }
}

