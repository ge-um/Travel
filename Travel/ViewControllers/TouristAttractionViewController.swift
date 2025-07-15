//
//  TouristAttractionViewController.swift
//  Travel
//
//  Created by 금가경 on 7/15/25.
//

import Kingfisher
import UIKit

class TouristAttractionViewController: UIViewController {
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    
    var travel: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        configureNavigationBar()
        configureTravelImageView()
        configureTitleLabel()
        configureDescriptionLabel()
        configureBackButton()
    }
    
    func configureTravelImageView() {
        let url = URL(string: travel?.travel_image ?? "")
        travelImageView.kf.setImage(with: url)
        travelImageView.layer.cornerRadius = 10
        travelImageView.contentMode = .scaleAspectFill
    }
    
    func configureTitleLabel() {
        titleLabel.text = travel?.title
        titleLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        titleLabel.textAlignment = .center
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.text = travel?.description
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .bold)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }
    
    func configureBackButton() {
        var config = UIButton.Configuration.filled()
        
        var attributedTitle = AttributedString("다른 관광지 보러 가기")
        attributedTitle.font = .systemFont(ofSize: 14, weight: .semibold)
        attributedTitle.foregroundColor = .white
        
        config.attributedTitle = attributedTitle
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .paleBlue
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        backButton.configuration = config
    }
    
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .lightGray
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.title = "관광지 화면"
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
