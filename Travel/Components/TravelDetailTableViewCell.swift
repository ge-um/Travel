//
//  TravelDetailTableViewCell.swift
//  SeSAC_DAY11
//
//  Created by 금가경 on 7/13/25.
//

import Kingfisher
import UIKit

class TravelDetailTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        configureTravelImageView()
        configureLikeButton()
        configureTitleLabel()
        configureDescriptionLabel()
        configureInfoLabel()
    }
    
    func configureTravelImageView() {
        travelImageView.backgroundColor = .systemGray2
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 8
    }
    
    func configureLikeButton() {
        likeButton.tintColor = .white
    }
    
    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        titleLabel.numberOfLines = 0
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .medium)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 0
    }
    
    func configureInfoLabel() {
        infoLabel.font = .systemFont(ofSize: 13, weight: .regular)
        infoLabel.textColor = .systemGray2
        infoLabel.numberOfLines = 0
    }
}
