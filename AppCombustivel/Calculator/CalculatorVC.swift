//
//  CalculatorVC.swift
//  AppCombustivel
//
//  Created by Lucas Oliveira on 23/04/24.
//

import UIKit

class CalculatorVC: UIViewController {

    var screen: CalculatorScreen?
    var alert: Alert?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func validateTextFields() -> Bool {
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else { return false }
        guard let gasPrice = screen?.gasPriceTextField.text else { return false }
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores do Álcool e da Gasolina")
            return false
        } else if ethanolPrice.isEmpty && !gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor do Álcool")
            return false
        } else if !ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor a Gasolina")
            return false
        }
        
        return true
    }
    
}

extension CalculatorVC: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        if validateTextFields() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0")) as? Double ?? 0.0
            let gasPrice: Double = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.0")) as? Double ?? 0.0
            
            let vc: ResultVC?
            
            if ethanolPrice / gasPrice > 0.7 {
                vc = ResultVC(recommendFuel: .gas)
            } else {
                vc = ResultVC(recommendFuel: .ethanol)
            }
            
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
}
