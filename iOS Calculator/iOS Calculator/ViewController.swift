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
    var _size = CGSize.zero
    var buttonWidth: CGFloat = 0
    var buttonHeight: CGFloat = 0
    
    // variate
    var maxY: CGFloat = 0
    var buttonX: CGFloat = 0
    var buttonY: CGFloat = 0
    
    // view
    var _mainView: UIView!
    var _answerLabel: UILabel!
    var _numButton: UIButton!
    var _clearButton: UIButton!
    var _inverseButton: UIButton!
    var _percentButton: UIButton!
    var _deleteButton: UIButton!
    var _divideButton: UIButton!
    var _multiplyButton: UIButton!
    var _subtractButton: UIButton!
    var _addButton: UIButton!
    var _equalButton: UIButton!
    var _periodButton: UIButton!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // constant setting
        _size = UIScreen.main.bounds.size
        self.view.backgroundColor = .black
        
        // view setting
        setStatusBar()
        setAnswerLabel()
        setNumButton()
        
        print("Did load: ViewController")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //------------------------------------------
    // View Setting
    //------------------------------------------
    
    func setStatusBar() {
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: _size.width, height: 20))
        statusBar.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.0)
        self.view.addSubview(statusBar)
        maxY = statusBar.frame.maxY
    }
    
    func setAnswerLabel() {
        let labelHeight: CGFloat = 0.227 * (_size.height - 20)
        _answerLabel = UILabel(frame: CGRect(x: 0, y: maxY, width: _size.width, height: labelHeight))
        _answerLabel.backgroundColor = .red
        self.view.addSubview(_answerLabel)
        maxY = _answerLabel.frame.maxY
    }
    
    func setNumButton() {
        buttonWidth = _size.width / 4.0
        buttonHeight = (_size.height - _answerLabel.frame.height - 20) / 5.0
        for btag in numBtnTag.values {
            switch btag.rawValue {
            case 1, 4, 7, 10:
                buttonX = 0
            case 2, 5, 8:
                buttonX = buttonWidth
            default:
                buttonX = buttonWidth * 2
            }
            switch btag.rawValue {
            case 7, 8, 9:
                buttonY = maxY + buttonHeight
            case 4, 5, 6:
                buttonY = maxY + buttonHeight * 2
            case 1, 2, 3:
                buttonY = maxY + buttonHeight * 3
            default:
                buttonY = maxY + buttonHeight * 4
            }
            _numButton = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight))
            _numButton.backgroundColor = .cyan
            _numButton.tag = btag.rawValue
            _numButton.setTitle(btag.toStr(), for: .normal)
            _numButton.layer.borderColor = UIColor.white.cgColor
            _numButton.layer.borderWidth = 1.0
            self.view.addSubview(_numButton)
        }
    }
    
    func setFuncButton() {
        
    }
}

enum numBtnTag: Int {
    case one = 1, two, three, four, five, six, seven, eight, nine, zero
    static let values: [numBtnTag] = [one, two, three, four, five, six, seven, eight, nine, zero]
    
    func toStr() -> String {
        if self == numBtnTag.zero {
            return "0"
        } else {
            return String(self.rawValue)
        }
    }
}

enum funcBtnTag: Int {
    
}

