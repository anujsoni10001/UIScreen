//
//  SetofButton.swift
//  UIScreen
//
//  Created by Anuj Soni on 08/02/23.
//

import Foundation
import UIKit

class TextView: UIView {
    
    
    let doLabel = UILabel()
    let doLabelData = UILabel()
    let dontLable = UILabel()
    let dontLableData = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 600)
    }
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [doLabel, doLabelData, dontLable, dontLableData])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
}

extension TextView {
    func style() {
        self.backgroundColor = .white
        doLabel.translatesAutoresizingMaskIntoConstraints = false
        doLabel.text = "doTitle".localizableString("en")

        
        doLabelData.translatesAutoresizingMaskIntoConstraints = false
        doLabelData.text = "doLabelData".localizableString("en")
        doLabelData.font = UIFont.systemFont(ofSize: 13)
        doLabelData.numberOfLines = 0
        doLabelData.preferredMaxLayoutWidth = 300
        doLabelData.lineBreakMode = NSLineBreakMode.byWordWrapping
        doLabelData.sizeToFit()
        
        dontLable.translatesAutoresizingMaskIntoConstraints = false
        dontLable.text = "dontLable".localizableString("en")
        dontLableData.translatesAutoresizingMaskIntoConstraints = false
        dontLableData.text = "dontLableData".localizableString("en")
        dontLableData.font = UIFont.systemFont(ofSize: 13)
        dontLableData.numberOfLines = 0
        dontLableData.preferredMaxLayoutWidth = 200
        dontLableData.lineBreakMode = NSLineBreakMode.byWordWrapping
        dontLableData.sizeToFit()
    }
    
    func layout() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
           
        ])
    }

}




