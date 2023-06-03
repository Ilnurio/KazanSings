//
//  InfoTableViewController.swift
//  KazanSings
//
//  Created by M I C H A E L on 02.06.2023.
//

import UIKit

final class InfoTableViewController: UITableViewController {
    
    let infoList = InfoList.getInfoList()
    
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
        content.textProperties.color = .white
        
        let selectedView = UIView()
            selectedView.backgroundColor = UIColor(named: "CellColor")
            cell.selectedBackgroundView = selectedView
        
        if infoList[indexPath.section].segueIDs?[indexPath.row] != nil {
            let image = UIImage(systemName: "chevron.right") ?? UIImage()
            let accessory = UIImageView(frame:CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
            
            accessory.image = image
            accessory.tintColor = UIColor.opaqueSeparator
            cell.accessoryView = accessory
        }
        
    
        content.image = UIImage(systemName: imageName) ?? UIImage(named: imageName)
        content.text = titleName
        
        
        cell.contentConfiguration = content
        return cell
    }
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
