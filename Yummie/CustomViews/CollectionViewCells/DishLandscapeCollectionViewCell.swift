//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by Maryna Bolotska on 05/02/24.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cardView: UIView = {
        let view = CardView()
        
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()

    let titleLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    let dishImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
      
           return imageView
       }()
    let descriptionLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let caloriesLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
}


extension DishLandscapeCollectionViewCell {
    func setupUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(dishImageView)
        cardView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLbl)
        stackView.addArrangedSubview(descriptionLbl)
        stackView.addArrangedSubview(caloriesLbl)
        
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dishImageView.snp.makeConstraints { make in
        
//            make.top.leading.bottom.equalTo(cardView)
//            make.width.equalTo(100) // looks like it's the same, but i prefer to use 0.5
            make.leading.top.bottom.equalToSuperview()
           make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
        }
        
        stackView.snp.makeConstraints { make in
//            make.top.bottom.trailing.equalTo(cardView)
//            make.leading.equalTo(dishImageView).offset(8)
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.equalTo(dishImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
}
