//
//  AdTableViewCell.swift
//  SeSAC_DAY11
//
//  Created by 금가경 on 7/13/25.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adBackgroundView: UIView!
    
    let colors: [UIColor] = [.palePink, .paleBlue, .paleGreen]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    func configure() {
        configureBackground()
        configureTitleLabel()
        configureAdLabel()
    }
    
    func configureBackground() {
        adBackgroundView.backgroundColor = colors.randomElement()!
        adBackgroundView.layer.cornerRadius = 10
    }
    
    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
    }
    
    func configureAdLabel() {
        adLabel.text = "AD"
        adLabel.font = .systemFont(ofSize: 13)
        adLabel.textAlignment = .center
        adLabel.backgroundColor = .white
        adLabel.clipsToBounds = true
        adLabel.layer.cornerRadius = 7
    }
}
