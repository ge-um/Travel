//
//  CityTableViewController.swift
//  Travel
//
//  Created by 금가경 on 7/15/25.
//

import UIKit

class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var locationSegmentedControl: UISegmentedControl!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var cityCollectionView: UICollectionView!
    
    let cities = CityInfo.city
    var filteredCities: [City] = []
    
    //TODO: - 섹션 전환했을 때도 텍스트가 남아있다면 섹션에 맞는 데이터가 filter되도록 만들기.
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        configure()
    }

    func registerNib() {
        let nibName = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(nibName, forCellWithReuseIdentifier: "CityCollectionViewCell")
    }
    
    // MARK: - Configure View
    func configure() {
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        
        filteredCities = cities
        configureNavigationBar()
        configureLayout()
    }
    
    // TODO: - navigationBar 전체의 apperance를 환경 설정으로 둘 수 있는지 알아보기
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .lightGray
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.title = "관광지 화면"
    }
    
    func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (2 * 12) - 16
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellWidth / 2 + 72)
        
        cityCollectionView.collectionViewLayout = layout
    }
    
    // MARK: - Action
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: filteredCities = cities
        case 1: filteredCities = cities.filter { $0.domestic_travel }
        case 2: filteredCities = cities.filter { !$0.domestic_travel }
        default: break
        }
        
        cityCollectionView.reloadData()
    }
    
    // TODO: - Combine
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        print(#function)
        search(text: sender.text!)
    }
    
    @IBAction func searchTextChanged(_ sender: UITextField) {
        print(#function)
        search(text: sender.text!)
    }
    
    // MARK: - Logic
    // TODO: - 필터 성능 향상
    func search(text: String) {
        print(#function, text)
        
        let target = text.trimmingCharacters(in: .whitespaces).lowercased()
        
        filteredCities = cities.filter {
            let loweredCityName = $0.city_name.lowercased()
            let loweredCityEnglishName =  $0.city_english_name.lowercased()
            let loweredCityExplain = $0.city_explain.lowercased()
                                    
            return (loweredCityName.contains(target) || loweredCityEnglishName.contains(target) || loweredCityExplain.contains(target))
        }
        
        cityCollectionView.reloadData()
    }
    
    // MARK: - CollectionView Setting
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        let city = filteredCities[indexPath.row]
        cell.configure(with: city)
        
        return cell
    }
}
