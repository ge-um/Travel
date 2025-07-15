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
    
    func configure(city: City) {
        configureCityImageView(image: city.city_image)
        configureCityNameLabel(name: city.city_name, engName: city.city_english_name)
        configureCityExplainLabel(explain: city.city_explain)
    }
    
    func configureCityImageView(image: String) {
        let url = URL(string: image)
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
    }
    
    func configureCityNameLabel(name: String, engName: String) {
        cityNameLabel.text = "\(name) | \(engName)"
    }

    func configureCityExplainLabel(explain: String) {
        cityExplainLabel.text = explain
    }
}
