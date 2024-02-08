//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Maryna Bolotska on 04/02/24.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    

    
    private let oneView: UIView = {
     //      let oneView = CardView()
        let oneView = UIView()
      oneView.layer.borderWidth = 1
        oneView.layer.cornerRadius = 5
     
      
           return oneView
       }()
    
    private let categoryImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let categoryTitleLbl: UILabel = {
        let label = UILabel()
//        label.adjustsFontSizeToFitWidth = true
//        label.minimumScaleFactor = 0.3
        label.numberOfLines = 0
        return label
    }()
    
 
}


// MARK: - Private methods
private extension CategoryCollectionViewCell {
    func initialize() {
        contentView.addSubview(oneView)
        
        oneView.addSubview(categoryImageView)
        oneView.addSubview(categoryTitleLbl)
        oneView.layer.cornerRadius = 5
        oneView.layer.borderWidth = 1
       oneView.layer.borderColor = UIColor.darkGray.cgColor
        
        oneView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        categoryImageView.snp.makeConstraints { make in
                make.height.equalTo(40)
                 make.centerY.equalTo(oneView)  // Center the image vertically
                make.leading.equalTo(oneView).offset(10)  // Adjust the leading space as needed
                 make.width.equalTo(40)
            }
            
            categoryTitleLbl.snp.makeConstraints { make in
                make.centerY.equalTo(categoryImageView)
                make.leading.equalTo(categoryImageView.snp.trailing).offset(3)
                make.trailing.equalTo(oneView).offset(-3)
            }
    }
}
