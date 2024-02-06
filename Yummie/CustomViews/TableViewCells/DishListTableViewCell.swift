//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by Maryna Bolotska on 06/02/24.
//

import UIKit


class DishListTableViewCell: UITableViewCell {
    static let identifier = "DishListTableViewCell"
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
    
    private let cardView: UIView = {
        let view = CardView()
        
        return view
    }()
    
    private let dishImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension DishListTableViewCell {
    func setupUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(dishImageView)
        cardView.addSubview(titleLbl)
        cardView.addSubview(descriptionLbl)
       
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        dishImageView.snp.makeConstraints { make in
            make.centerY.equalTo(cardView)
            make.leading.equalTo(cardView).offset(10)
            make.width.equalTo(50)
        }
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(cardView).offset(10)
            make.leading.equalTo(dishImageView.snp.trailing).offset(10)
        }
        
        descriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(20)
            make.leading.equalTo(titleLbl)
        }
        
    }
}
