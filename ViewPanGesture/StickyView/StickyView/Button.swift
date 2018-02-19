//
//  Button.swift
//  StickyView
//
//  Created by Skander Jabouzi on 2018-02-18.
//  Copyright © 2018 Medigarage Studios LTD. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    var id: Int?
    typealias DidTapButton = (Button) -> ()
    
    var didTouchUpInside: DidTapButton? {
        didSet {
            if didTouchUpInside != nil {
                addTarget(self, action: #selector(didTouchUpInsideFunc(_:)), for: .touchUpInside)
            } else {
                removeTarget(self, action: #selector(didTouchUpInsideFunc(_:)), for: .touchUpInside)
            }
        }
    }
    
    // MARK: - Actions
    
    func didTouchUpInsideFunc(_ button: UIButton) {
        if let handler = didTouchUpInside {
            handler(self)
        }
    }
    
}
