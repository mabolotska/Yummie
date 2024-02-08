//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Maryna Bolotska on 06/02/24.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {
    
    var category: DishCategory!
    var dishes: [Dish] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
      
        ProgressHUD.colorProgress = .blue
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    

    
}


extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}


extension ListDishesViewController {
    func setupUI() {
        view.backgroundColor = .white
        title = category.name
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DishListTableViewCell.self, forCellReuseIdentifier: String(describing: DishListTableViewCell.self))
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
                     make.edges.equalToSuperview()
                 }
    }
}
