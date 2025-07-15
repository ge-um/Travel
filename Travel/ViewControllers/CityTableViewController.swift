//
//  CityTableViewController.swift
//  Travel
//
//  Created by 금가경 on 7/15/25.
//

import UIKit

class CityTableViewController: UITableViewController {
    @IBOutlet var locationSegmentedControl: UISegmentedControl!
    
    let cities = CityInfo.city
    var filteredCities: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        configure()
        
        filteredCities = cities
    }

    func registerNib() {
        let nibName = UINib(nibName: "CityTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CityTableViewCell")
    }
    
    // MARK: - TableView Setting

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        let city = filteredCities[indexPath.row]
        
        cell.configure(city: city)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    // MARK: - Configure View
    func configure() {
        configureNavigationBar()
    }
    
    /// navigationBar 전체의 apperance를 환경 설정으로 둘 순 없을까?
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .lightGray
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.title = "관광지 화면"
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: filteredCities = cities
        case 1: filteredCities = cities.filter { $0.domestic_travel }
        case 2: filteredCities = cities.filter { !$0.domestic_travel }
        default: break
        }
        
        tableView.reloadData()
    }
}
