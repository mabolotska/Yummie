//
//  ViewController.swift
//  Yummie
//
//  Created by Maryna Bolotska on 03/02/24.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    private let collectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
          let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
          collectionView.backgroundColor = .white
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
          return collectionView
      }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .lightGray
        return pageControl
    }()
    

    
    private let nextBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(nextBtnClicked), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        inizialize()

        
        slides = [
        OnboardingSlide(title: "Delicious Dishes",
                        description: "Experience a variety of amazing dishes from different cultures around the world.",
                        image: UIImage(named: "slide1")!),
        OnboardingSlide(title: "World-Class Chefs",
                        description: "Our dishes are prepared by only the best.", 
                        image: UIImage(named: "slide2")!),
        OnboardingSlide(title: "Instant World-Wide Delivery",
                        description: "Your orders will be delivered instantly irrespective of your location around the world.", 
                        image: UIImage(named: "slide3")!)
        ]
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(500)
               }
    }

    
    @objc func nextBtnClicked() {
        if currentPage == slides.count - 1 {
            let controller = HomeViewController()
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }

}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}



extension OnboardingViewController {
    func inizialize() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(nextBtn)
        
        pageControl.numberOfPages = 3
        

        pageControl.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-60)
            make.width.equalToSuperview().multipliedBy(2.0/3.0)
        }
    }
}
