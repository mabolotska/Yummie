//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by Maryna Bolotska on 05/02/24.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {
    static let identifier = "DishPortraitCollectionViewCell"
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
    // MARK: - Init
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
        stackView.spacing = 2
        return stackView
    }()

    let titleLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    let caloriesLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .red
        return label
    }()
    let descriptionLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let dishImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
      
           return imageView
       }()
}


extension DishPortraitCollectionViewCell {
    func setupUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(stackView)
        stackView.addArrangedSubview(titleLbl)
        stackView.addArrangedSubview(dishImageView)
        stackView.addArrangedSubview(caloriesLbl)
        stackView.addArrangedSubview(descriptionLbl)
        

               cardView.snp.makeConstraints { make in
                   make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
               }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(cardView)
        }
    }
}
