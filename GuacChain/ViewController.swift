//
//  ViewController.swift
//  GuacChain
//
//  Created by Jennifer Joseph on 12/5/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tacoQtyLabel: UILabel!
    @IBOutlet weak var burritoQtyLabel: UILabel!
    @IBOutlet weak var chipsQtyLabel: UILabel!
    @IBOutlet weak var horchataQtyLabel: UILabel!
    @IBOutlet weak var bitcoinTotalLabel: UILabel!
    @IBOutlet weak var currencyTotalLabel: UILabel!
    
    @IBOutlet weak var tacoStepper: UIStepper!
    @IBOutlet weak var burritoStepper: UIStepper!
    @IBOutlet weak var chipsStepper: UIStepper!
    @IBOutlet weak var horchataStepper: UIStepper!
    
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func tacoStepperPressed(_ sender: UIStepper) {
        tacoQtyLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func burritoStepperPressed(_ sender: UIStepper) {
        burritoQtyLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func chipsStepperPressed(_ sender: UIStepper) {
        chipsQtyLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func horchataStepperPressed(_ sender: UIStepper) {
        horchataQtyLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func currencySegmentPressed(_ sender: UISegmentedControl) {
    }
    
    
    
}

