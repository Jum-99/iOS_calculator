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
    var _mainView: UIView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // constant setting
        _size = UIScreen.main.bounds.size;
        self.view.backgroundColor = .white;
        
        // view setting
        setMainView();
        
        print("Did load: CalculatorViewController");
    }
    
    //------------------------------------------
    // View Setting
    //------------------------------------------
    
    func setMainView() {
        _mainView = UIView(frame: CGRect(origin: CGPoint.zero, size: _size));
        _mainView.backgroundColor = .blue;
        self.view.addSubview(_mainView);
    }
}
