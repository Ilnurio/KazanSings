//
//  AboutUsTableViewController.swift
//  KazanSings
//
//  Created by Ilnur on 05.06.2023.
//

import UIKit

final class AboutUsTableViewController: UITableViewController {
    
    private let aboutUs = AboutUs.getAboutUs()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        aboutUs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let aboutUs = aboutUs[indexPath.row]
        content.text = aboutUs.nameSurName
        content.secondaryText = aboutUs.statusInTeam
        content.textProperties.color = .white
        content.image = UIImage(named: aboutUs.imageName)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        content.imageProperties.tintColor = .white
        cell.separatorInset.left = view.frame.width
        cell.contentConfiguration = content
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
