//
//  CalculatorViewController.swift
//  iOS Calculator
//
//  Created by JumpeiNitta on 2017/12/29.
//  Copyright © 2017年 JumpeiNitta. All rights reserved.
//

import Foundation
import UIKit

class CalculatorViewController: UIViewController {
    
    // constant
    var _size = CGSize.zero;

    // variate

    // view
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        _size = UIScreen.main.bounds.size;
        self.view.backgroundColor = .white;
        
        print("Did load: CalculatorViewController");
    }
}
