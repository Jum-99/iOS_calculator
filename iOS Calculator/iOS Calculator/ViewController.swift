//
//  ViewController.swift
//  iOS Calculator
//
//  Created by JumpeiNitta on 2017/12/22.
//  Copyright © 2017年 JumpeiNitta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // constant
    var _size = CGSize.zero;
    
    // variate
    
    // view
    var _mainView: UIView!;
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // constant setting
        _size = UIScreen.main.bounds.size;
        self.view.backgroundColor = .white;
        
        // view setting
        setMainView();
        
        print("Did load: CalculatorViewController");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

