import UIKit

class ContainerViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }

    private var menuState: MenuState = .closed
    
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?
    lazy var InfoVC = InfoViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .red
        addChildVCs()
    }
    
    private func addChildVCs() {
        // Menu
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        // Home
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
}

extension ContainerViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
        toggleMenu(completion: nil)
    }
    
    func toggleMenu(completion: (() -> Void)?) {
        // Animate the menu
        switch menuState {
        case.closed:
            // Open it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 160
                
            } completion: { done in
                if done {
                    self.menuState = .opened
                    
                }
            }
            
        case .opened:
            // Close it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = 0
                
            } completion: { done in
                if done {
                    self.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

extension ContainerViewController: MenuViewControllerDelegate {
    
    func didSelect(menuItem: MenuViewController.MenuOptions) {
        didTapMenuButton()
        toggleMenu { [weak self] in
            switch menuItem {
            case .home:
                self?.resetToHome()
            case .info:
                // Add info child
                self?.addInfo()
            case .appRating:
                break
            case .shareApp:
                break
            case .settings:
                break
            case .caseWithKEYA:
                break
            case .support:
                break
            case .contactus:
                break
            case .addCRN:
                break
            }
        }
    }
    
    func addInfo() {
        let vc = InfoVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        homeVC.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func resetToHome() {
        InfoVC.view.removeFromSuperview()
        InfoVC.didMove(toParent: nil)
        //homeVC.title = "Home"
    }
}
