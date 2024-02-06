//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Maryna Bolotska on 06/02/24.
//

import UIKit

class ListOrdersViewController: UIViewController {
    
    var orders: [Order] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        return table
    }()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
        
    }
    
  
    
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}


extension ListOrdersViewController {
    func setupUI() {
        view.backgroundColor = .white
        title = "Orders"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.register(DishListTableViewCell.self, forCellReuseIdentifier: String(describing: DishListTableViewCell.self))
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
                     make.edges.equalToSuperview()
                 }
    }
}
