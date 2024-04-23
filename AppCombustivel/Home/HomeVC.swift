//
//  HomeVC.swift
//  AppCombustivel
//
//  Created by Lucas Oliveira on 23/04/24.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }


}

extension HomeVC: HomeScreenDelegate {
    func tappedStartButton() {
        let vc = CalculatorVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
