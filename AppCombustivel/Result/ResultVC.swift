//
//  ResultVC.swift
//  AppCombustivel
//
//  Created by Lucas Oliveira on 23/04/24.
//

import UIKit

enum RecommendFuel: String {
    case gas = "Gasolina"
    case ethanol = "Álcool"
}

class ResultVC: UIViewController {
    
    var screen: ResultScreen?
    let recommendFuel: RecommendFuel
    
    init(recommendFuel: RecommendFuel) {
        self.recommendFuel = recommendFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.resultLabel.text = recommendFuel.rawValue
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }

}

extension ResultVC: ResultScreenDelegate {
    func tappedRecalculateButton() {
        popViewController()
    }
    
    func tappedBackButton() {
        popViewController()
    }
}
