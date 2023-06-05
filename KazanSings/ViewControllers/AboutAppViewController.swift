//
//  AboutUsViewController.swift
//  KazanSings
//
//  Created by Ilnur on 04.06.2023.
//

import UIKit

final class AboutAppViewController: UIViewController {
    
    @IBOutlet var aboutAppLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        shareAboutApp()
    }
}

extension AboutAppViewController {
    func shareAboutApp() {
        let aboutApp = AboutApp.getAboutUs()
        aboutAppLabel.text = aboutApp.title
    }
}
