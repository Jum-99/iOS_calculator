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
    var _resultLabel: UILabel!
    var _numButton: UIButton!
    var _funcButton: UIButton!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // constant setting
        _size = UIScreen.main.bounds.size
        self.view.backgroundColor = .black
        
        // view setting
        setStatusBar()
        setResultLabel()
        setNumButton()
        setFuncButton()
        
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
    
    func setResultLabel() {
        let labelHeight: CGFloat = 0.227 * (_size.height - 20)
        _resultLabel = UILabel(frame: CGRect(x: 0, y: maxY, width: _size.width, height: labelHeight))
        _resultLabel.backgroundColor = .red
        self.view.addSubview(_resultLabel)
        maxY = _resultLabel.frame.maxY
    }
    
    func setNumButton() {
        buttonWidth = _size.width / 4.0
        buttonHeight = (_size.height - _resultLabel.frame.height - 20) / 5.0
        for nbtag in numBtnTag.values {
            switch nbtag.rawValue {
            case 1, 4, 7, 10:
                buttonX = 0
            case 2, 5, 8:
                buttonX = buttonWidth
            default:
                buttonX = buttonWidth * 2
            }
            switch nbtag.rawValue {
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
            _numButton.tag = nbtag.rawValue
            _numButton.setTitle(nbtag.toStr(), for: .normal)
            _numButton.layer.borderColor = UIColor.white.cgColor
            _numButton.layer.borderWidth = 1.0
            self.view.addSubview(_numButton)
        }
    }
    
    func setFuncButton() {
        for fbtag in funcBtnTag.fvalues {
            switch fbtag.rawValue {
            case "clear":
                buttonX = 0
            case "inverse", "period":
                buttonX = buttonWidth
            case "percent", "equal":
                buttonX = buttonWidth * 2
            default:
                buttonX = buttonWidth * 3
            }
            switch fbtag.rawValue {
            case "divide":
                buttonY = maxY + buttonHeight
            case "multiple":
                buttonY = maxY + buttonHeight * 2
            case "subtract":
                buttonY = maxY + buttonHeight * 3
            case "add", "period", "equal":
                buttonY = maxY + buttonHeight * 4
            default:
                buttonY = maxY
            }
            _funcButton = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight))
            _funcButton.backgroundColor = .green
            _funcButton.tag = fbtag.numbering()
            _funcButton.setTitle(fbtag.rawValue, for: .normal)
            _funcButton.layer.borderColor = UIColor.white.cgColor
            _funcButton.layer.borderWidth = 1.0
            self.view.addSubview(_funcButton)
        }
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

enum funcBtnTag: String {
    case clear = "clear"
    case inverse = "inverse"
    case percent = "percent"
    case delete = "delete"
    case divide = "divide"
    case multiple = "multiple"
    case subtract = "subtract"
    case add = "add"
    case equal = "equal"
    case period = "period"
    static let fvalues: [funcBtnTag] = [clear, inverse, percent, delete, divide, multiple, subtract, add, equal, period]
    
    func numbering() -> Int {
        switch self {
        case .clear:
            return 11
        case .inverse:
            return 12
        case .percent:
            return 13
        case .delete:
            return 14
        case .divide:
            return 24
        case .multiple:
            return 34
        case .subtract:
            return 44
        case .add:
            return 54
        case .equal:
            return 53
        default: // case "period":
            return 52
        }
    }
}

