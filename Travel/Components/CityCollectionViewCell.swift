//
//  CityCollectionViewCell.swift
//  Travel
//
//  Created by 금가경 on 7/17/25.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //TODO: - layoutSubview에 관해 공부하기
    override func layoutSubviews() {
        super.layoutSubviews()
        cityImageView.layer.cornerRadius = cityImageView.frame.height / 2
    }

    func configure(with city: City) {
        configureImageView(name: city.city_image)
        configureTitleLabel(title: "\(city.city_name) | \(city.city_english_name)")
        configureExplainLabel(explain: city.city_explain)
    }
    
    func configureImageView(name: String) {
        let url = URL(string: name)
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
    }
    
    func configureTitleLabel(title: String) {
        cityTitleLabel.text = title
        cityTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        cityTitleLabel.textAlignment = .center
    }
    
    // TODO: - 텍스트 위쪽 정렬
    func configureExplainLabel(explain: String) {
        cityExplainLabel.text = explain
        cityExplainLabel.textColor = .lightGray
        cityExplainLabel.font = .systemFont(ofSize: 12, weight: .light)
        cityExplainLabel.numberOfLines = 0
        cityExplainLabel.textAlignment = .center
    }
}
