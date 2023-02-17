//
//  ProfileView.swift
//  UIScreen
//
//  Created by Anuj Soni on 12/02/23.
//

import Foundation

import Foundation
import UIKit

class ProfileView: UIView {
    
    let stackView1 = UIStackView()
    let stackView2 = UIStackView()
    let stackView3 = UIStackView()
    let nameLabel = UILabel()
    let accNumberLabel = UILabel()
    let profilePicture = UIImageView()
    let lastLoginLabel = UILabel()
    
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

extension ProfileView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .vertical
        stackView1.tintColor = .white
        
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .horizontal
        stackView2.tintColor = .white
        stackView2.spacing = 10
        
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.axis = .vertical
        stackView3.tintColor = .white
        stackView3.spacing = 10
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Rahul Singh"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        accNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        accNumberLabel.text = "CRN   XXXX743"
        accNumberLabel.textColor = .white
        accNumberLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.image = UIImage(systemName: "person.crop.circle.fill")
        profilePicture.tintColor = .white
        profilePicture.contentMode = .scaleAspectFit
        
        profilePicture.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profilePicture.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lastLoginLabel.text = "Last Login: 07-02-2023 11:25:16 (IST)"
        lastLoginLabel.textColor = .white
        lastLoginLabel.font = UIFont.boldSystemFont(ofSize: 9.5)
        
    }
    
    func layout() {
        stackView1.addArrangedSubview(nameLabel)
        stackView1.addArrangedSubview(accNumberLabel)
        
        stackView2.addArrangedSubview(profilePicture)
        stackView2.addArrangedSubview(stackView1)
        
        stackView3.addArrangedSubview(stackView2)
        stackView3.addArrangedSubview(lastLoginLabel)
        addSubview(stackView3)
    }
}
