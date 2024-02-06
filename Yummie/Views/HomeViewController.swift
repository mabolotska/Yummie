//
//  HomeViewController.swift
//  Yummie
//
//  Created by Maryna Bolotska on 03/02/24.
//

import UIKit

class HomeViewController: UIViewController  {
    var categories: [DishCategory] = [.init(id: "fdhdhdf", name: "fhdfh", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg"),
                                      .init(id: "fdhdhdf", name: "fhdfh", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg"),
                                      .init(id: "fdhdhdf", name: "fhdfh", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg"),
                                      .init(id: "fdhdhdf", name: "fhdfh", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg"),
                                      .init(id: "fdhdhdf", name: "fhdfh", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg"),
                                      .init(id: "fdhdhdf", name: "fhdfh", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg"),
                                      .init(id: "fdhdhdf", name: "fhdfh", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg"),
                                      .init(id: "fdhdhdf", name: "fhdfh", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg"),
                                      
                                    ]
    
    var populars: [Dish] = [
        .init(name: "Popular Dish 1", description: "Description 1", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 200),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
    ]
    var specials: [Dish] = [
        .init(name: "Popular Dish 1", description: "Description 1", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 200),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
        .init(name: "Popular Dish 2", description: "Description 2", image: "https://previews.123rf.com/images/jeremywhat/jeremywhat1106/jeremywhat110600966/9895276-round-half-tone-images-round-black-white-pattern-design.jpg", calories: 250),
    ]
    
    private let myScrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    private let oneStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.backgroundColor = .gray
        stack.spacing = 2
        return stack
    }()
    
    private let foodView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let foodLabel: UILabel = {
        let label = UILabel()
        label.text = "Food Category"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let foodViewPop: UIView = {
        let view = UIView()
        return view
    }()
    
    private let foodLabelPop: UILabel = {
        let label = UILabel()
        label.text = "Popular Dishes"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let foodViewChief: UIView = {
        let view = UIView()
        return view
    }()
    
    private let foodLabelChief: UILabel = {
        let label = UILabel()
        label.text = "Chief's Specials"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let foodCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)

        return collectionView
    }()
    
    private let foodCollectionViewPop: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DishPortraitCollectionViewCell.self, forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)

        return collectionView
    }()
    
    private let foodCollectionViewChief: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DishLandscapeCollectionViewCell.self, forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)

        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        inizialize()
        
       
    }
    

}


extension HomeViewController {
    func inizialize() {
        view.backgroundColor = .white
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        foodCollectionViewPop.delegate = self
        foodCollectionViewPop.dataSource = self
        foodCollectionViewChief.delegate = self
        foodCollectionViewChief.dataSource = self
        myScrollView.delegate = self
        myScrollView.isUserInteractionEnabled = true
        foodCollectionView.isUserInteractionEnabled = true
        foodCollectionViewPop.isUserInteractionEnabled = true
        foodCollectionViewChief.isUserInteractionEnabled = true
        myScrollView.contentSize = CGSize(width: view.frame.size.width + foodView.frame.size.width, height: view.frame.size.height)
        title = "Yummie"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .systemPink
        view.addSubview(myScrollView)
        
        myScrollView.addSubview(oneStack)
        
        oneStack.addArrangedSubview(foodView)
        oneStack.addArrangedSubview(foodViewPop)
        oneStack.addArrangedSubview(foodViewChief)
        
        foodView.addSubview(foodLabel)
        foodView.addSubview(foodCollectionView)
        
        foodViewPop.addSubview(foodLabelPop)
        foodViewPop.addSubview(foodCollectionViewPop)
        
        foodViewChief.addSubview(foodLabelChief)
        foodViewChief.addSubview(foodCollectionViewChief)
        
        
        myScrollView.snp.makeConstraints { make in
                  make.edges.equalToSuperview()
              }
        

        
        oneStack.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
                make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
      
        }
        
        foodView.snp.makeConstraints { make in
           make.top.leading.trailing.equalTo(oneStack)
            
            make.bottom.equalTo(foodCollectionView.snp.bottom)
        }
        foodLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(foodView).offset(10)
            
        }
        
        foodViewPop.snp.makeConstraints { make in
           make.leading.trailing.equalTo(oneStack)
            make.top.equalTo(foodView.snp.bottom).offset(5)
            make.bottom.equalTo(foodCollectionViewPop.snp.bottom)
        }
        foodLabelPop.snp.makeConstraints { make in
            make.top.leading.equalTo(foodViewPop).offset(10)
            
        }
        
        foodViewChief.snp.makeConstraints { make in
            make.leading.trailing.equalTo(oneStack)
            make.top.equalTo(foodViewPop.snp.bottom).offset(5)
        }
        
        foodLabelChief.snp.makeConstraints { make in
            make.top.leading.equalTo(foodViewChief).offset(10)
            
        }
        
        
        foodCollectionView.snp.makeConstraints { make in
            make.top.equalTo(foodLabel.snp.bottom).offset(10)
            make.leading.equalTo(foodView).offset(10)
          
            make.height.equalTo(160)
       //     make.width.equalTo(300)
            make.trailing.equalTo(foodView)
        }
        
        foodCollectionViewPop.snp.makeConstraints { make in
            make.top.equalTo(foodLabelPop.snp.bottom).offset(10)
            make.leading.equalTo(foodViewPop).offset(10)
          
            make.height.equalTo(270)
            make.trailing.equalTo(foodViewPop)
        }
        
        foodCollectionViewChief.snp.makeConstraints { make in
            make.top.equalTo(foodLabelChief.snp.bottom).offset(10)
            make.leading.equalTo(foodViewChief).offset(10)
          
            make.height.equalTo(130)
            make.trailing.equalTo(foodViewChief)
        }
    }
}


extension HomeViewController: UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case foodCollectionView:
            return categories.count
        case foodCollectionViewPop:
            return populars.count
        case foodCollectionViewChief:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case foodCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case foodCollectionViewPop:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case foodCollectionViewChief:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
        
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.width - 60) / 2
        
        
        if collectionView == foodCollectionView {
            return CGSize(width: itemWidth, height: 73)
        } 
        else if collectionView == foodCollectionViewPop {
            return CGSize(width: 123, height: 193)
        }
        
        else if collectionView == foodCollectionViewChief {
            return CGSize(width: 323, height: 73)
        }
        
        return CGSize(width: 123, height: 73)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == foodCollectionView {
            let controller = ListDishesViewController()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } 
        else {
            let controller = DishDetailViewController()
            controller.dish = collectionView == foodCollectionViewPop ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}


extension HomeViewController {
    func setupCollectionView() {
        
    }
}
