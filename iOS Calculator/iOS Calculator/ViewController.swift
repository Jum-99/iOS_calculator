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
    var maxY: CGFloat = 0;
    
    // view
    var _mainView: UIView!;
    var _answerLabel: UILabel!;
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // constant setting
        _size = UIScreen.main.bounds.size;
        self.view.backgroundColor = .black;
        
        // view setting
//        setMainView();
        setStatusBar();
        setAnswerLabel();
        
        print("Did load: CalculatorViewController");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //------------------------------------------
    // View Setting
    //------------------------------------------
    
//    func setMainView() {
//        _mainView = UIView(frame: CGRect(origin: CGPoint.zero, size: _size));
//        _mainView.backgroundColor = .blue;
//        self.view.addSubview(_mainView);
//    }
    
    func setStatusBar() {
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: _size.width, height: 20));
        statusBar.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.0);
        self.view.addSubview(statusBar);
        maxY = statusBar.frame.height;
    }
    
    func setAnswerLabel() {
        let labelHeight: CGFloat = 0.227 * (_size.height - 20);
        _answerLabel = UILabel(frame: CGRect(x: 0, y: maxY, width: _size.width, height: labelHeight));
        _answerLabel.backgroundColor = .red;
        self.view.addSubview(_answerLabel);
    }
    

}

