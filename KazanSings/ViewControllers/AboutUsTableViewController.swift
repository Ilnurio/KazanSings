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
        tableView.rowHeight = 60
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        aboutUs.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "MainColor")
        
        let label = UILabel()
        label.textColor = .opaqueSeparator
        label.text = aboutUs[section].statusInTeam
        label.frame = CGRect(x: 15, y: 3, width: tableView.bounds.size.width - 30, height: 20)
        
        headerView.addSubview(label)
        
        return headerView
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageName = aboutUs[indexPath.section].imageName[indexPath.row]
        let nameSurName = aboutUs[indexPath.section].nameSurName[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = nameSurName
        content.textProperties.color = .white
        content.textProperties.font = .boldSystemFont(ofSize: 17)
        
        content.image = UIImage(named: imageName)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        content.imageProperties.tintColor = .white
        
        cell.contentConfiguration = content
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showAboutFounder", sender: nil)
    }
}
