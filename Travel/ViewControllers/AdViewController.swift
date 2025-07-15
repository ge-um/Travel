//
//  AdViewController.swift
//  Travel
//
//  Created by 금가경 on 7/15/25.
//

import UIKit

class AdViewController: UIViewController {
    @IBOutlet var adTitleLabel: UILabel!
    
    var adTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        adTitleLabel.text = adTitle
        adTitleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        adTitleLabel.numberOfLines = 0
        adTitleLabel.textAlignment = .center
    }

    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
