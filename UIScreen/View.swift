//
//  SetofButton.swift
//  UIScreen
//
//  Created by Anuj Soni on 08/02/23.
//

import Foundation
import UIKit

class TextView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension TextView {
    func style() {
        self.backgroundColor = UIColor.red
    }
    
    func layout() {
        
    }

}


