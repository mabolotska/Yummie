//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Maryna Bolotska on 06/02/24.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    var category: DishCategory!
    var dishes: [Dish] = [
        .init(name: "Popular Dish 1", description: "Description 1", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 200),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
    ]
    
    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        return 100
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
