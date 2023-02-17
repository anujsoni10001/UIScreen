//
//  MainViewController.swift
//  UIScreen
//
//  Created by Anuj Soni on 15/02/23.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    let stackView = UIStackView()
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension MainViewController{
    
    func style(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Launch", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(goToVC), for: .touchUpInside)
    }
    
    func layout(){
        stackView.addArrangedSubview(button)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
        ])
        
    }
    
    @objc func goToVC(_ sender: UIButton) {
        navigationController?.pushViewController(ViewController(), animated: true)
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
}
