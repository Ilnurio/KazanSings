//
//  InfoTableViewController.swift
//  KazanSings
//
//  Created by M I C H A E L on 02.06.2023.
//

import UIKit

final class InfoTableViewController: UITableViewController {
    
    private let infoList = InfoList.getInfoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = view.frame.height / 14
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        infoList.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "MainColor")
        
        let label = UILabel()
        label.textColor = .opaqueSeparator
        label.text = infoList[section].header
        label.frame = CGRect(x: 15, y: 3, width: tableView.bounds.size.width - 30, height: 20)
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoList[section].titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageName = infoList[indexPath.section].imageNames[indexPath.row]
        let titleName = infoList[indexPath.section].titles[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.imageProperties.tintColor = .white
        
        switch indexPath.section {
        case 0...infoList.count - 2:
            let selectedView = UIView()
            selectedView.backgroundColor = UIColor(named: "CellColor")
            cell.selectedBackgroundView = selectedView
            
            if infoList[indexPath.section].segueIDs?[indexPath.row] != nil {
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
            
            content.textProperties.color = .white
            content.image = UIImage(systemName: imageName) ?? UIImage(named: imageName)
        default:
            cell.selectionStyle = .none
            cell.separatorInset.left = view.frame.width
            content.textProperties.color = .opaqueSeparator
            content.textProperties.alignment = .center
        }
        
        content.text = titleName
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let link = infoList[indexPath.section].links?[indexPath.row] ?? ""
        let title = infoList[indexPath.section].titles[indexPath.row]
        
        switch indexPath.section {
        case 0 where indexPath.row != 1:
            guard let url = URL(string: link) else { return }
            showOkAlert(title: title, message: link) { _ in
                UIApplication.shared.open(url)
            }
        case 0 where indexPath.row == 1:
            sendMail(mail: [link], subject: "Пользователь «Казань Поёт»")
        case 1:
            performSegue(
                withIdentifier: infoList[indexPath.section].segueIDs?[indexPath.row] ?? "",
                sender: nil
            )
        case 2 where indexPath.row == 0:
            let appLink = FirebaseManager.shared.appLinkString
            guard let url = URL(string: appLink) else { return }
            showOkAlert(title: title, message: appLink) { _ in
                UIApplication.shared.open(url)
            }
        case 2 where indexPath.row != 0:
            guard let url = URL(string: link) else { return }
            showOkAlert(title: title, message: link) { _ in
                UIApplication.shared.open(url)
            }
        default:
            break
        }
    }
}
