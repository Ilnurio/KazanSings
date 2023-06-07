//
//  FounderViewController.swift
//  KazanSings
//
//  Created by Ilnur on 07.06.2023.
//

import UIKit

class FounderViewController: UIViewController {
    
    @IBOutlet var imageLabel: UIImageView!
    @IBOutlet var introducationLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    private let aboutUs = AboutUs.getAboutUs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageLabel.round(
            cornerRadius: self.imageLabel.frame.size.width / 2,
            borderWidth: 3.0,
            borderColor: .white
        )
        
       // introducationLabel.text = aboutUs
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
