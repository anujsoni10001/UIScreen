

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController {

    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
       // title = "Home"
        let backButton = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))

        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func didTapMenuButton() {
        view.backgroundColor = .green
        delegate?.didTapMenuButton()
    }
}
