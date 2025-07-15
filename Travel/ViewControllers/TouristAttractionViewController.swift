//
//  TouristAttractionViewController.swift
//  Travel
//
//  Created by 금가경 on 7/15/25.
//

import UIKit

class TouristAttractionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
