//
//  ViewController.swift
//  UIScreen
//
//  Created by Anuj Soni on 07/02/23.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let textview = TextView()
    let englishButton = UIButton()
    let hindiButton = UIButton()
    let marathiButton = UIButton()
    let plusMore = UIButton()
    let hstackview = UIStackView()
    let continueButton = UIButton()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        setNavigation()
        setupUI()
    }
    
    func setupUI() {
        style()
        layout()
        changeStatusBarColor()
    }
    
    func changeStatusBarColor() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = .red
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = .red
        }
    }
    
    func setNavigation() {
        let nav: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.size.height, width:view.frame.width, height:50))
        
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .red
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barTintColor = .purple
            UINavigationBar.appearance().isTranslucent = false
        }
        
        
        let navItem = UINavigationItem(title: "Safe Banking Tips")
        nav.setItems([navItem],animated:false)
        self.view.addSubview(nav)
    }
    
    @objc func showOptions() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let option1 = UIAlertAction(title: "Gujrati", style: .default) { _ in
            // handle option 1 selection
            self.textview.doLabel.text = "doTitle".localizableString("gu-IN")
            self.textview.doLabelData.text = "doLabelData".localizableString("gu-IN")
            self.textview.dontLable.text = "dontLable".localizableString("gu-IN")
            self.textview.dontLableData.text = "dontLableData".localizableString("gu-IN")
        }
        let option2 = UIAlertAction(title: "Japanese", style: .default) { _ in
            // handle option 2 selection
            self.textview.doLabel.text = "doTitle".localizableString("ja")
            self.textview.doLabelData.text = "doLabelData".localizableString("ja")
            self.textview.dontLable.text = "dontLable".localizableString("ja")
            self.textview.dontLableData.text = "dontLableData".localizableString("ja")
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(option1)
        alertController.addAction(option2)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    func style() {
        
        //STACK VIEW
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        textview.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        //HSTACK VIEW
        hstackview.translatesAutoresizingMaskIntoConstraints = false
        hstackview.axis = .horizontal
        hstackview.spacing = 16
        hstackview.distribution = .fillEqually
        hstackview.backgroundColor = .secondarySystemBackground
        
        //ENGLISH BUTTON
        englishButton.backgroundColor = .systemRed
        englishButton.layer.cornerRadius = 10
        englishButton.layer.borderWidth = 0.5
        englishButton.layer.borderColor = UIColor.black.cgColor
        englishButton.setTitle("English", for:.normal)
        englishButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        //HINDI BUTTON
        //hindiButton.configuration = .filled()
        hindiButton.backgroundColor = .systemRed
        hindiButton.layer.cornerRadius = 10
        hindiButton.layer.borderWidth = 0.5
        hindiButton.layer.borderColor = UIColor.black.cgColor
        hindiButton.setTitle("Hindi", for:.normal)
        hindiButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        //marathiButton.configuration = .filled()
        marathiButton.backgroundColor = .systemRed
        marathiButton.layer.cornerRadius = 10
        marathiButton.layer.borderWidth = 0.5
        marathiButton.layer.borderColor = UIColor.black.cgColor
        marathiButton.setTitle("Marathi", for:.normal)
        marathiButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        // plusMore.configuration = .filled()
        plusMore.backgroundColor = .systemRed
        plusMore.layer.cornerRadius = 10
        plusMore.layer.borderWidth = 0.5
        plusMore.layer.borderColor = UIColor.black.cgColor
        plusMore.setTitle("More", for: .normal)
        plusMore.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.configuration = .filled()
        //continueButton.backgroundColor = .red
        continueButton.tintColor = .red
        continueButton.layer.cornerRadius = 10
        continueButton.layer.borderWidth = 0.5
        continueButton.layer.borderColor = UIColor.black.cgColor
        continueButton.setTitle("Continue",for:.normal)
        
        englishButton.addTarget(self, action:#selector(buttonTapped1), for: .touchUpInside)
        hindiButton.addTarget(self, action: #selector(buttonTapped2), for: .touchUpInside)
        marathiButton.addTarget(self, action: #selector(buttonTapped3), for: .touchUpInside)
        plusMore.addTarget(self, action: #selector(showOptions), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(continueButton1), for: .touchUpInside)
    }
    
    func layout() {
        
        view.addSubview(scrollView)
       

        scrollView.addSubview(stackView)
        
        hstackview.addArrangedSubview(englishButton)
        hstackview.addArrangedSubview(hindiButton)
        hstackview.addArrangedSubview(marathiButton)
        hstackview.addArrangedSubview(plusMore)
        
        stackView.addArrangedSubview(hstackview)
        stackView.addArrangedSubview(textview)
        stackView.addArrangedSubview(continueButton)
        
//        for _ in 0..<20 {
//            stackView.addArrangedSubview(makeLabel())
//        }

        // ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant:6),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        // StackView within the ScrollView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        // The magic constraint needed to make all this work
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        
        // HStackView
        NSLayoutConstraint.activate([
            hstackview.leadingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor , multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: hstackview.trailingAnchor, multiplier: 1),
            hstackview.topAnchor.constraint(equalToSystemSpacingBelow:stackView.topAnchor, multiplier: 1)
        ])
        
        //TextView
        
        NSLayoutConstraint.activate([
            textview.leadingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor , multiplier: 1 ),
            stackView.trailingAnchor.constraint(equalToSystemSpacingAfter: textview.trailingAnchor, multiplier: 1),
            textview.topAnchor.constraint(equalToSystemSpacingBelow: hstackview.bottomAnchor, multiplier: 1)
        ])
        
        //Continue
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalToSystemSpacingBelow: textview.bottomAnchor, multiplier: 1)
        ])
    }
    
    @objc func buttonTapped1(sender: UIButton) {
        print("Button1 was tapped")
        //        titleLabel.text = "Hello"
        //        subtitleLabel.text = "Always visit the official website for the Bank's contact details"
        //        if(sender.isTouchInside){
        //        sender.backgroundColor = .blue
        //        }
        //sender.isSelected = !sender.isSelected
        //sender.backgroundColor = sender.isSelected ? UIColor.red : UIColor.blue
        
        textview.doLabel.text = "doTitle".localizableString("en")
        
        textview.doLabelData.text = "doLabelData".localizableString("en")
        
        textview.dontLable.text = "dontLable".localizableString("en")
        
        
        textview.dontLableData.text = "dontLableData".localizableString("en")
    }
    @objc func buttonTapped2(sender: UIButton){
        print("Button2 was tapped")
        
        textview.doLabel.text = "doTitle".localizableString("hi")
        textview.doLabelData.text = "doLabelData".localizableString("hi")
        textview.dontLable.text = "dontLable".localizableString("hi")
        textview.dontLableData.text = "dontLableData".localizableString("hi")
        
        //        titleLabel.text = "नमस्ते"
        //        subtitleLabel.text = "बैंक के संपर्क विवरण के लिए हमेशा आधिकारिक वेबसाइट पर जाएं"
        //        view.addSubview(hindiview)
        //sender.isSelected = !sender.isSelected
        //sender.backgroundColor = sender.isSelected ? UIColor.red : UIColor.blue
    }
    @objc func buttonTapped3(sender: UIButton){
        print("Button3 was tapped")
        //        titleLabel.text = "नमस्कार"
        //        subtitleLabel.text = "बँकेच्या संपर्क तपशीलांसाठी नेहमी अधिकृत वेबसाइटला भेट द्या"
        //sender.isSelected = !sender.isSelected
        //sender.backgroundColor = sender.isSelected ? UIColor.red : UIColor.blue
        textview.doLabel.text = "doTitle".localizableString("mr-IN")
        textview.doLabelData.text = "doLabelData".localizableString("mr-IN")
        textview.dontLable.text = "dontLable".localizableString("mr-IN")
        textview.dontLableData.text = "dontLableData".localizableString("mr-IN")
        
    }
    @objc func continueButton1(sender: UIButton){
        let vc = ContainerViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

//
//@objc func changeButtonTapped(sender: UIButton) {
//    sender.isSelected = !sender.isSelected
//    sender.backgroundColor = sender.isSelected ? UIColor.red : UIColor.blue
//}



