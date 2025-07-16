//
//  CityTableViewController.swift
//  Travel
//
//  Created by 금가경 on 7/15/25.
//

import UIKit

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var locationSegmentedControl: UISegmentedControl!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var cityTableView: UITableView!
    
    let cities = CityInfo.city
    var filteredCities: [City] = []
    
    //TODO: - 섹션 전환했을 때도 텍스트가 남아있다면 섹션에 맞는 데이터가 filter되도록 만들기.
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        configure()
        
        filteredCities = cities
    }

    func registerNib() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        let nibName = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTableView.register(nibName, forCellReuseIdentifier: "CityTableViewCell")
    }
    
    // MARK: - TableView Setting
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        let city = filteredCities[indexPath.row]
        
        cell.configure(city: city)
        
        return cell
    }

    // TODO: - Automatic Dimension 적용해보기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    // TODO: - 백버튼 글씨 없애기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CityDetailViewController") as! CityDetailViewController
        
        vc.title = "도시 상세 화면"
        vc.city = cities[indexPath.row]

        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Configure View
    func configure() {
        configureNavigationBar()
    }
    
    // TODO: - navigationBar 전체의 apperance를 환경 설정으로 둘 수 있는지 알아보기
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .lightGray
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.title = "관광지 화면"
    }
    
    // MARK: - Action
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: filteredCities = cities
        case 1: filteredCities = cities.filter { $0.domestic_travel }
        case 2: filteredCities = cities.filter { !$0.domestic_travel }
        default: break
        }
        
        cityTableView.reloadData()
    }
    
    // TODO: - 텍스트필드 터치만 했는데 느린 이유 알기
    // TODO: - Combine
    // TODO: - 대소문자 구별
    // TODO: - 검색 키워드에 해당하는 글자 색상 변경
    // TODO: - 필터 성능 향상
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        print(#function)
        search(text: sender.text!)
    }
    
    @IBAction func searchTextChanged(_ sender: UITextField) {
        print(#function)
        search(text: sender.text!)
    }
    
    //MARK: - Logic
    func search(text: String) {
        print(#function, text)
        
        let target = text.trimmingCharacters(in: .whitespaces)
        
        /// 이렇게 하면 앞에 true 나오면 뒤에도 마저 도나?
        filteredCities = cities.filter {
            return ($0.city_name.contains(target) || $0.city_english_name.contains(target) || $0.city_explain.contains(target))
        }
                
        cityTableView.reloadData()
    }
}
