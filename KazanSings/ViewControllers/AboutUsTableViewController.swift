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
    override func numberOfSections(in tableView: UITableView) -> Int {
        aboutUs.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        aboutUs[section].nameSurName.count
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
        
        if aboutUs[indexPath.section].statusInTeam == "Основатель" {
            let image = UIImage(systemName: "chevron.right") ?? UIImage()
            let accessory = UIImageView(frame: CGRect(
                x: 0,
                y: 0,
                width: image.size.width,
                height: image.size.height
            ))
            accessory.image = image
            accessory.tintColor = UIColor.opaqueSeparator
            cell.accessoryView = accessory
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let link = aboutUs[indexPath.section].link[indexPath.row]
        let title = aboutUs[indexPath.section].title[indexPath.row]
        
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "showAboutFounder", sender: nil)
        case 1:
            guard let url = URL(string: link) else { return }
            showOkAlert(title: link , message: title) { _ in
                UIApplication.shared.open(url)
            }
        case 2 where indexPath.row == 0:
            guard let url = URL(string: link) else { return }
            showOkAlert(title: link , message: title) { _ in
                UIApplication.shared.open(url)
            }
        default:
            break
        }
    }
}

//switch indexPath.section {
//case 0 where indexPath.row != 1:
//    guard let url = URL(string: link) else { return }
//    showOkAlert(title: title, message: link) { _ in
//        UIApplication.shared.open(url)
//    }
//case 0 where indexPath.row == 1:
//    sendMail(mail: [link], subject: "Пользователь «Казань Поёт»")
//case 1:
//    performSegue(
//        withIdentifier: infoList[indexPath.section].segueIDs?[indexPath.row] ?? "",
//        sender: nil
//    )
//default:
//    break
//}
