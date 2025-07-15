//
//  CityTableViewCell.swift
//  Travel
//
//  Created by 금가경 on 7/15/25.
//

import Kingfisher
import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // TODO: - background color clip하기
    override func layoutSubviews() {
        super.layoutSubviews()
        cityImageView.roundCorners(corners: [.topLeft, .bottomRight], radius: 30)
    }
    
    func configure(city: City) {
        configureCityImageView(image: city.city_image)
        configureCityNameLabel(name: city.city_name, engName: city.city_english_name)
        configureCityExplainLabel(explain: city.city_explain)
    }
    
    // TODO: - Kingfisher Downsizing 찾아보기
    func configureCityImageView(image: String) {
        let url = URL(string: image)
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
    }
    
    func configureCityNameLabel(name: String, engName: String) {
        cityNameLabel.text = "\(name) | \(engName)"
        cityNameLabel.textColor = .white
        cityNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    func configureCityExplainLabel(explain: String) {
        cityExplainLabel.text = "  \(explain)"
        cityExplainLabel.textColor = .white
        cityExplainLabel.font = .systemFont(ofSize: 16, weight: .thin)
        cityExplainLabel.backgroundColor = .black.withAlphaComponent(0.5)
    }
}
