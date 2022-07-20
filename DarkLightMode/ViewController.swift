//
//  ViewController.swift
//  DarkLightMode
//
//  Created by Rashid Latif on 20/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var userInterfaceStyleSegmentedControl:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInterfaceStyleSegmentedControl.selectedSegmentIndex = UserDefaults.standard.getUserInterfaceStyle().getIndex
    }
    
    @IBAction private func switchMode(_ sender: UISegmentedControl){
        let index = sender.selectedSegmentIndex
        UserInterfaceStyle.changeStyle(style: UserInterfaceStyleType.setIndex(index: index))
    }
    
}
