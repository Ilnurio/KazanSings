//
//  InfoViewController.swift
//  KazanSings
//
//  Created by Ilnur on 02.06.2023.
//

import UIKit

final class InfoViewController: UIViewController {
    
    
    
    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = infoTitle
    }
}
