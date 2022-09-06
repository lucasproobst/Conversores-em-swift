//
//  ViewController.swift
//  Conversores
//
//  Created by Lucas Probst on 27/08/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tf_valor: UITextField!
    @IBOutlet weak var bt_celsius: UIButton!
    @IBOutlet weak var bt_farenheint: UIButton!
    @IBOutlet weak var lb_resultado: UILabel!
    @IBOutlet weak var lb_ResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ShowNext(_ sender: UIButton) {
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                bt_celsius.setTitle("Kilograma", for: .normal)
                bt_farenheint.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                bt_celsius.setTitle("Real", for: .normal)
                bt_farenheint.setTitle("Dolar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distancia"
                bt_celsius.setTitle("Metro", for: .normal)
                bt_farenheint.setTitle("Kilometro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                bt_celsius.setTitle("Celsius", for: .normal)
                bt_farenheint.setTitle("Farenheint", for: .normal)
        }
        Converter(nil)
    }
    
    @IBAction func Converter(_ sender: UIButton?) {
        if let sender = sender{
            if sender == bt_celsius {
                bt_farenheint.alpha = 0.5
            } else {
                bt_celsius.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        view.endEditing(true)
        let result = Double(lb_resultado.text!)!
        lb_resultado.text = String(format: "%0.2f", result)
    }
    
    func calcTemperature() {
        guard let temperature = Double(tf_valor.text!) else {return}
        
        if bt_celsius.alpha == 1.0 {
            lb_ResultUnit.isHidden = false
            lb_ResultUnit.text = "Farenheint"
            lb_resultado.text = String(temperature * 1.8 + 32.0)
        } else {
            lb_ResultUnit.isHidden = false
            lb_ResultUnit.text = "Celsius"
            lb_resultado.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(tf_valor.text!) else {return}
        
        if bt_celsius.alpha == 1.0 {
            lb_ResultUnit.isHidden = false
            lb_ResultUnit.text = "Libra"
            lb_resultado.text = String(weight / 2.2046)
        } else {
            lb_ResultUnit.isHidden = false
            lb_ResultUnit.text = "Metros"
            lb_resultado.text = String(weight * 2.2046)
    }
}
    
    func calcCurrency() {
        guard let currency = Double(tf_valor.text!) else {return}
        
        if bt_celsius.alpha == 1.0 {
            lb_ResultUnit.isHidden = false
            lb_ResultUnit.text = "Dolar"
            lb_resultado.text = String(currency / 3.5)
        } else {
            lb_ResultUnit.isHidden = false
            lb_ResultUnit.text = "Real"
            lb_resultado.text = String(currency * 3.5)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(tf_valor.text!) else {return}
        
        if bt_celsius.alpha == 1.0 {
            lb_ResultUnit.isHidden = false
            lb_ResultUnit.text = "Kilometro"
            lb_resultado.text = String(distance / 1000.0)
        } else {
            lb_ResultUnit.isHidden = false
            lb_ResultUnit.text = "Metros"
            lb_resultado.text = String(distance * 1000.0)
    }
    }
}

