//
//  Alert.swift
//  AppCombustivel
//
//  Created by Lucas Oliveira on 23/04/24.
//

import UIKit

class Alert {
    
    let controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        controller?.present(alertController, animated: true)
    }
}
