//
//  CardView.swift
//  Yummie
//
//  Created by Maryna Bolotska on 04/02/24.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.cornerRadius = 10.0

              // Set border width and color
              layer.borderWidth = 1.0
              layer.borderColor = UIColor.gray.cgColor

              // Set long shadow effect
              layer.shadowColor = UIColor.black.cgColor
              layer.shadowOffset = CGSize(width: 5, height: 3)
              layer.shadowOpacity = 0.5
              layer.shadowRadius = 3.0

              // Create a custom shadow path for a long shadow
             
    }
}
