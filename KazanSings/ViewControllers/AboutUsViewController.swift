//
//  AboutUsViewController.swift
//  KazanSings
//
//  Created by Ilnur on 04.06.2023.
//

import UIKit

final class AboutUsViewController: UIViewController {
    
    @IBOutlet var aboutUsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        shareAboutUs()
    }
}

extension AboutUsViewController {
    func shareAboutUs() {
        let aboutUs = AboutUs.getAboutUs()
        aboutUsLabel.text = aboutUs.title
    }
}
