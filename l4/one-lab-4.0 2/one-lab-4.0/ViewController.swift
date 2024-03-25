//
//  ViewController.swift
//  one-lab-4.0
//
//  Created by NYerdikul on 10.03.2024.
//

import UIKit

class CustomUIAlertController: UIAlertController {
    override func loadView() {
        super.loadView()
        NotificationCenter.default.removeObserver(self)
    }
    
    deinit {
        print("deinit")
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var users: [User]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUsers()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        let controller = CustomUIAlertController(title: "Name", message: nil, preferredStyle: .alert)
        controller.addTextField()
        let action = UIAlertAction(title: "Сохранить", style: .default) { _ in
            let name = controller.textFields?.first?.text
            RealmStore().save(name: name ?? "", count: 0)
            self.updateUsers()
        }
        controller.addAction(action)
        present(controller, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserTableViewCell
        let user = users?[indexPath.row]
        
        cell?.countLabel.text = "\(user?.count ?? 0)"
        cell?.nameTitle.text = user?.firstName ?? "" + " " + (user?.lastName ?? "")
        return cell ?? UITableViewCell()
    }
}
extension ViewController: UITableViewDelegate {
    
    
}

private extension ViewController {
    func updateUsers() {
        users = RealmStore().fetchAllUsers()
    }
}
