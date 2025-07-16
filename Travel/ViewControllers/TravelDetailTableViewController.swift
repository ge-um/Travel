//
//  TravelDetailTableViewController.swift
//  SeSAC_DAY11
//
//  Created by 금가경 on 7/13/25.
//

import Kingfisher
import UIKit

// TODO: - Need Recatoring
class TravelDetailTableViewController: UITableViewController {
    var travel = TravelInfo.travel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNib()
    }
    
    func registerNib() {
        let adNibName = UINib(nibName: "AdTableViewCell", bundle: nil)
        let travelDetailNibName = UINib(nibName: "TravelDetailTableViewCell", bundle: nil)
        
        tableView.register(adNibName, forCellReuseIdentifier: "ad")
        tableView.register(travelDetailNibName, forCellReuseIdentifier: "travel")
    }
    
    // MARK: - TableView Setting
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travel = travel[indexPath.row]
        
        if travel.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ad", for: indexPath) as! AdTableViewCell
            configureTitleLabel(cell: cell, travel: travel)
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "travel", for: indexPath) as! TravelDetailTableViewCell
            
            configureCityImageView(cell: cell, travel: travel)
            configureTitleLabel(cell: cell, travel: travel)
            configureDescriptionLabel(cell: cell, travel: travel)
            configureInfoLabel(cell: cell, travel: travel)
            configureLikeButton(cell: cell, indexPath: indexPath)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let travel = travel[indexPath.row]
        
        if travel.ad {
            let adViewController = storyboard.instantiateViewController(identifier: "AdViewController") as! AdViewController
            
            adViewController.adTitle = travel.title
            adViewController.modalPresentationStyle = .fullScreen
            
            present(adViewController, animated: true)
        } else {
            let touristAttractionViewController = storyboard.instantiateViewController(identifier: "TouristAttractionViewController") as! TouristAttractionViewController
            
            touristAttractionViewController.travel = travel
            navigationController?.pushViewController(touristAttractionViewController, animated: true)
        }
    }

    // MARK: - View Configure
    func configureCityImageView(cell: TravelDetailTableViewCell, travel: Travel) {
        let url = URL(string: travel.travel_image ?? "")
        
        cell.travelImageView.kf.indicatorType = .activity
        cell.travelImageView.kf.setImage(with: url)
    }
    
    func configureTitleLabel(cell: TravelDetailTableViewCell, travel: Travel) {
        cell.titleLabel.text = travel.title
    }
    
    func configureDescriptionLabel(cell: TravelDetailTableViewCell, travel: Travel) {
        cell.descriptionLabel.text = travel.description
    }
    
    func configureInfoLabel(cell: TravelDetailTableViewCell, travel: Travel) {
        let grade = travel.grade
        let save = travel.save
        
        guard let grade = grade, let save = save else {
            return
        }
        
        let formattedSave = formatNumber(save)
        let stars = convertGradeToStars(grade)
        
        let ratingCount = (1...2000).randomElement()!
        let formattedRatingCount = formatNumber(ratingCount)
        
        let info = "\(stars) (\(formattedRatingCount)) · 저장 \(formattedSave)"
        let attributedText = makeAttributedStarText(text: info, stars: stars)

        cell.infoLabel.attributedText = attributedText
    }
    
    func configureLikeButton(cell: TravelDetailTableViewCell, indexPath: IndexPath) {
        let travel = travel[indexPath.row]
        var config = UIButton.Configuration.plain()
        
        if let like = travel.like {
            let imageName = like ? "heart.fill" : "heart"
            config.image = UIImage(systemName: imageName)
        }
        
        cell.likeButton.configuration = config
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    func configureTitleLabel(cell: AdTableViewCell, travel: Travel) {
        cell.titleLabel.text = travel.title
    }
    
    func convertGradeToStars(_ rating: Double) -> String {
        let filledCount = Int(rating)
        return String(repeating: "★", count: filledCount) + String(repeating: "☆", count: 5-filledCount)
    }
    
    func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: number as NSNumber)!
    }
    
    func makeAttributedStarText(text: String, stars: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: text)
        let starRange = (text as NSString).range(of: stars)
        attributedText.addAttribute(.foregroundColor, value: UIColor.systemYellow, range: starRange)
        
        return attributedText
    }
    
    // MARK: - Action
    @objc func likeButtonTapped(sender: UIButton) {
        let index = sender.tag
        travel[index].like?.toggle()
        tableView.reloadData()
    }
}
