//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Maryna Bolotska on 03/02/24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let slideImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let slideTitleLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let slideDescriptionLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.minimumScaleFactor = 0.3
        return label
    }()
}




// MARK: - Private methods
private extension OnboardingCollectionViewCell {
    func initialize() {
        contentView.addSubview(slideImageView)
        contentView.addSubview(slideTitleLbl)
        contentView.addSubview(slideDescriptionLbl)
        
        
        slideImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
         //   make.height.equalTo(contentView.snp.height).multipliedBy(2.0 / 3.0)
            make.height.equalTo(300)
      //      make.width.equalTo(300)
            make.centerX.equalToSuperview()
        }
        slideTitleLbl.snp.makeConstraints { make in
            make.top.equalTo(slideImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        slideDescriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(slideTitleLbl.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        
    }
    
}
