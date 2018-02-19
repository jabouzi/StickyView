//
//  MyView.swift
//  StickyView
//
//  Created by Skander Jabouzi on 2018-02-18.
//  Copyright © 2018 Medigarage Studios LTD. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    //var button: Button!
    //var lineView: UIView!
    var buttons = [Button]()
    var routesNumber: Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupHeader() {
        let customGray = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.00)
        let button = Button(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 40))
        button.id = 0
        button.backgroundColor = customGray
        button.setTitle("Select One Routes", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let lineView = UIView(frame: CGRect(x: 0, y: button.frame.size.height - 1.0, width: button.frame.size.width, height: 0.5))
        //CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
        lineView.backgroundColor = customGray
        button.addSubview(lineView)
//        debugPrint(button)
        buttons.append(button)
        self.addSubview(button)
    }
    
    func setup() {
        if let numbers = routesNumber {
            for i in 1...numbers - 1 {
                let button = Button(frame: CGRect(x: 0, y: buttons[i - 1].frame.origin.y + buttons[i - 1].frame.size.height + 1 , width: self.frame.size.width, height: 60))
                button.id = i
                button.backgroundColor = .white
                button.setTitle("Route # \(i)", for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.didTouchUpInside = { (button) in
                    print(button.id)
                }
                let lineView = UIView(frame: CGRect(x: 5, y: button.frame.size.height - 1.0, width: button.frame.size.width - 10, height: 0.5))
                //CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
                lineView.backgroundColor = UIColor.lightGray
                button.addSubview(lineView)
                buttons.append(button)
                self.addSubview(button)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.addSubview(button)
    }
}


