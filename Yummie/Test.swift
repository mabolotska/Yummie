//
//  Test.swift
//  Yummie
//
//  Created by Maryna Bolotska on 04/02/24.
//

import Foundation
import UIKit
import SnapKit

class MyViewController: UIViewController {
    
    let imageView = UIImageView()
    let stackView = UIStackView()
    let label1 = UILabel()
    let label2 = UILabel()
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the imageView
        imageView.image = UIImage(named: "slide1")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        view.backgroundColor = .white
        // Set up the stackView
        // Set up the stackView
               stackView.axis = .vertical
               stackView.spacing = 10
               view.addSubview(stackView)
               
               // Add labels and textField to stackView
               let labelsStackView = UIStackView()
               labelsStackView.axis = .horizontal
               labelsStackView.spacing = 10
               labelsStackView.addArrangedSubview(label1)
               labelsStackView.addArrangedSubview(label2)
               
               stackView.addArrangedSubview(labelsStackView)
               stackView.addArrangedSubview(textField)
               
               // Set up constraints using SnapKit
               imageView.snp.makeConstraints { make in
                   make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
                   make.leading.trailing.equalToSuperview().inset(20)
                   make.height.equalTo(200)
               }
               
               stackView.snp.makeConstraints { make in
                   make.top.equalTo(imageView.snp.bottom).offset(20)
                   make.leading.trailing.equalToSuperview().inset(20)
                   make.bottom.lessThanOrEqualToSuperview().inset(20)
               }
               
               textField.snp.makeConstraints { make in
                   make.height.equalTo(40)
               }
               
               // Set up label texts
               label1.text = "Label 1"
               label2.text = "Label 2"
           }
}
