//
//  EnglishViewController.swift
//  UIScreen
//
//  Created by Anuj Soni on 08/02/23.
//

import Foundation
import UIKit


class EnglishViewController:UIViewController{
    
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "First Screen"
        setupButton()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupButton(){
        view.addSubview(nextButton)
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPink
        nextButton.configuration?.title = "Next"
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.addTarget(self, action:#selector(goToNextScreen), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant:200),
            nextButton.heightAnchor.constraint(equalToConstant:50)
        ])
    }
    
    @objc func goToNextScreen(){
        let nextScreen = SecondScreen()
        nextScreen.title = "Second Screen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}



