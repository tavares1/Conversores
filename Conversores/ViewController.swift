//
//  ViewController.swift
//  Conversores
//
//  Created by Lucas Tavares Vasconcelos on 28/06/18.
//  Copyright © 2018 Lucas Tavares Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btnUnit1: UIButton!
    @IBOutlet weak var btnUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func showNext(_ sender: Any) {
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btnUnit1.setTitle("Kilograma", for: .normal)
                btnUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btnUnit1.setTitle("Real", for: .normal)
                btnUnit2.setTitle("Dolar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btnUnit1.setTitle("Kilômetro", for: .normal)
                btnUnit2.setTitle("Metro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btnUnit1.setTitle("Celsius", for: .normal)
                btnUnit2.setTitle("Fahrenheit", for: .normal)
            }
        
        convert(nil)
        view.endEditing(true)
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
//        Change alpha another button
        if let sender = sender{
            if sender == btnUnit1{
                btnUnit2.alpha = 0.5
            }else{
                btnUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
//        Make the convert
        switch lbUnit.text!{
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrency()
        default:
            calcDistance()
        }
    }
    
    func calcTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btnUnit1.alpha == 1.0 {
            lbResultUnit.text = "Celsius"
            lbResult.text = String(temperature * 1.8 + 32)
        }else{
            lbResultUnit.text = "Fahrenheit"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btnUnit1.alpha == 1.0 {
            lbResultUnit.text = "Kilômetro"
            lbResult.text = String(weight/2.2046)
        }else{
            lbResultUnit.text = "Libra"
            lbResult.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
        if btnUnit1.alpha == 1.0 {
            lbResultUnit.text = "Dólar"
            lbResult.text = String(currency / 3.5)
        }else{
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 3.5)
        }
    }
    
    func calcDistance(){
        guard let distance = Double(tfValue.text!) else {return}
        if btnUnit1.alpha == 1.0 {
            lbUnit.text = "Kilômetro"
            lbResult.text = String(distance/1000.0)
        }else{
            lbUnit.text = "Celsius"
            lbResult.text = String(distance/1000.0)
        }
    }
}


