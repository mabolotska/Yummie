//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Maryna Bolotska on 05/02/24.
//

import UIKit


class DishDetailViewController: UIViewController {
    var dish: Dish!
    
    private let dishImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let cardView: UIView = {
        let view = CardView()
        view.layer.cornerRadius = 5
        return view
    }()
    
    
    private let oneStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    let titleLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    let descriptionLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    let caloriesLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .red
        return label
    }()
     private let nameField: UITextField = {
        let textField = UITextField()
         textField.placeholder = "Enter your name"
         textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Place Order", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateView()
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
}


extension DishDetailViewController {
    func setupUI() {
        view.backgroundColor = .white
        
        let labelsStackView = UIStackView()
                labelsStackView.axis = .horizontal
                
                labelsStackView.addArrangedSubview(titleLbl)
                labelsStackView.addArrangedSubview(caloriesLbl)
        
        
        view.addSubview(dishImageView)
        view.addSubview(cardView)
        
        cardView.addSubview(oneStack)
        
        
        oneStack.addArrangedSubview(labelsStackView)
       
        oneStack.addArrangedSubview(descriptionLbl)
        oneStack.addArrangedSubview(nameField)
        oneStack.addArrangedSubview(orderButton)
        
        

        dishImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(2.0/3.0)
        }
        cardView.snp.makeConstraints { make in
            make.top.equalTo(dishImageView.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }
        
        oneStack.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(cardView)
            
        }
        
//        titleLbl.snp.makeConstraints { make in
//            make.leading.top.equalTo(oneStack).offset(5)
//        }
//        
//        caloriesLbl.snp.makeConstraints { make in
//            make.centerY.equalTo(titleLbl)
//            make.trailing.equalTo(oneStack).offset(-10)
//        }
        
    }
}
