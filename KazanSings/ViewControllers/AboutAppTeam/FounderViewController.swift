//
//  FounderViewController.swift
//  KazanSings
//
//  Created by Ilnur on 07.06.2023.
//

import UIKit

final class FounderViewController: UIViewController {
    
    @IBOutlet private var imageLabel: UIImageView!
    @IBOutlet private var introductionLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var vkButton: UIButton!
    @IBOutlet private var tgButton: UIButton!
    
    private let aboutUs = AboutUs.getAboutUs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introductionLabel.text = aboutUs.first?.introduction
        descriptionLabel.text = aboutUs.first?.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageLabel.round(
            cornerRadius: imageLabel.frame.size.width / 2,
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
    
    @IBAction private func tgButtonTapped() {
        guard let url = URL(string: aboutUs.first?.link.first ?? "") else { return }
        showOkAlert(title: title ?? "", message: aboutUs.first?.title.first ?? "") { _ in
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction private func vkButtonTapped() {
        guard let url = URL(string: aboutUs.first?.link.last ?? "") else { return }
        showOkAlert(title: title ?? "", message: aboutUs.first?.title.last ?? "") { _ in
            UIApplication.shared.open(url)
        }
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
