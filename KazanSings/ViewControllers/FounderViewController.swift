//
//  FounderViewController.swift
//  KazanSings
//
//  Created by Ilnur on 07.06.2023.
//

import UIKit

class FounderViewController: UIViewController {
    
    @IBOutlet var imageLabel: UIImageView!
    @IBOutlet var introductionLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var vkButton: UIButton!
    @IBOutlet var tgButton: UIButton!
    
    private let aboutUs = AboutUs.getAboutUs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introductionLabel.text = aboutUs.first?.introduction
        descriptionLabel.text = aboutUs.first?.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageLabel.round(
            cornerRadius: self.imageLabel.frame.size.width / 2,
            borderWidth: 3.0,
            borderColor: .white
        )
        
        tgButton.setImage(UIImage(named: "telegramshare"), for: .normal)
        tgButton.setTitle("Написать в TG", for: .normal)
        tgButton.backgroundColor = UIColor(named: "PopOverColor")
        
        vkButton.setImage(UIImage(named: "vkshare"), for: .normal)
        vkButton.setTitle("Написать в VK", for: .normal)
        vkButton.backgroundColor = UIColor(named: "PopOverColor")
    }
    
    @IBAction func tgButtonTapped() {
        
    }
    
    @IBAction func vkButtonTapped() {
        
    }
    
}

extension UIView {
    func round(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }
}
