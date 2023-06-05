//
//  AboutUsViewController.swift
//  KazanSings
//
//  Created by Ilnur on 04.06.2023.
//

import UIKit

final class AboutAppViewController: UIViewController {
    
    @IBOutlet private var aboutAppLabel: UILabel!
    
    private let aboutApp = AboutApp.getAboutUs()

    override func viewDidLoad() {
        super.viewDidLoad()
        aboutAppLabel.text = aboutApp.title
    }
}
