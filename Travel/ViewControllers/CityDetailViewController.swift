//
//  CityDetailViewController.swift
//  Travel
//
//  Created by 금가경 on 7/16/25.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet var detailInfoLabel: UILabel!
    
    var city = City(city_name: "", city_english_name: "", city_explain: "", city_image: "", domestic_travel: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailInfoLabel.text = "\(city.city_name) | \(city.city_english_name) \n \(city.city_explain)"
    }
    
    // TODO: - override func prepare에 대해 알아보기.
}
