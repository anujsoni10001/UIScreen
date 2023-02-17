import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func didSelect(menuItem: MenuViewController.MenuOptions)
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: MenuViewControllerDelegate?
    
    enum MenuOptions: String, CaseIterable {
        case home = "Profile"
        case info = "Choose Language"
        case appRating = "One View"
        case shareApp = "Device Management"
        case settings = "Settings"
        case caseWithKEYA = "Chat with KEYA"
        case support = "Help and support"
        case contactus = "Contact Us"
        case addCRN = "Add CRN"
        
        var imageName: String {
            switch self {
            
            case .home:
                return "person.crop.circle.fill"
            case .info:
                return "airplane"
            case .appRating:
                return "helm"
            case .shareApp:
                return "message"
            case .settings:
                return "gear"
            case .caseWithKEYA:
                return "character.bubble"
            case .support:
                return "questionmark.circle"
            case .contactus:
                return "person.crop.circle.badge"
            case .addCRN:
                return "plus"
            }
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let greyColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        

        profileView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 25).isActive = true
        profileView.topAnchor.constraint(equalTo: tableView.topAnchor, constant:40).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top + 44, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    
    // Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .black
        cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .black
        cell.backgroundColor = .systemRed
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOptions.allCases[indexPath.row]
        print(item)
        delegate?.didSelect(menuItem: item)
        print(indexPath.row)
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return profileView
//    }
}


