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
    
    let tacoPrice = 5.0
    let burritoPrice = 8.0
    let chipsPrice = 3.0
    let horchataPrice = 2.0
    
    var currencyRate = CurrencyRate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyRate.getData {
            print("Called Successfully!")
        }
    }
    
    func calcTotal() {
        
        var totalTaco = tacoPrice * tacoStepper.value
        var totalBurrito = burritoPrice * burritoStepper.value
        var totalChips = chipsPrice * chipsStepper.value
        var totalHorchata = horchataPrice * horchataStepper.value
        var dollarTotal = totalTaco + totalBurrito + totalChips + totalHorchata
        
        let bitcoinTotal = dollarTotal / currencyRate.dollarPerBTC
        let bitcoinTotalString = "฿\(bitcoinTotal)"
        bitcoinTotalLabel.text = bitcoinTotalString
        
        switch currencySegmentedControl.selectedSegmentIndex {
        case 0 :
            let dollarTotalString = String(format: "$%.2f", dollarTotal)
            currencyTotalLabel.text = dollarTotalString
        case 1:
            let poundTotal = bitcoinTotal * currencyRate.poundPerBTC
            let poundTotalString = String(format: "£%.2f", poundTotal)
            currencyTotalLabel.text = poundTotalString
        case 2:
            let euroTotal = bitcoinTotal * currencyRate.euroPerBTC
            let poundTotalString = String(format: "€%.2f", euroTotal)
            currencyTotalLabel.text = poundTotalString
        default:
            print("ERROR: Conversion Error")
        }
    }
    

    @IBAction func tacoStepperPressed(_ sender: UIStepper) {
        tacoQtyLabel.text = "\(Int(sender.value))"
        calcTotal()
    }
    
    @IBAction func burritoStepperPressed(_ sender: UIStepper) {
        burritoQtyLabel.text = "\(Int(sender.value))"
        calcTotal()
    }
    
    @IBAction func chipsStepperPressed(_ sender: UIStepper) {
        chipsQtyLabel.text = "\(Int(sender.value))"
        calcTotal()
    }
    
    @IBAction func horchataStepperPressed(_ sender: UIStepper) {
        horchataQtyLabel.text = "\(Int(sender.value))"
        calcTotal()
    }
    
    @IBAction func currencySegmentPressed(_ sender: UISegmentedControl) {
        calcTotal()
    }

}

