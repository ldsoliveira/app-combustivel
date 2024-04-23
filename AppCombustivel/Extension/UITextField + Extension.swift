//
//  UITextField + Extension.swift
//  AppCombustivel
//
//  Created by Lucas Oliveira on 23/04/24.
//

import Foundation
import UIKit

extension UITextField {
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let done = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(doneButtonAction))
        
        let itens = [flexSpace, done]
        
        doneToolbar.items = itens
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
