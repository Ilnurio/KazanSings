//
//  BitRateViewController.swift
//  KazanSings
//
//  Created by M I C H A E L on 06.06.2023.
//

import UIKit

final class BitRateViewController: UIViewController {

    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var bitRateTableView: UITableView!
    
    private let bitRate = BitRate.getBitRate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        bitRateTableView.isScrollEnabled = false
        bitRateTableView.rowHeight = view.frame.height / 15
        bitRateTableView.sectionHeaderHeight = view.frame.height / 18
    }
    
    override func viewWillLayoutSubviews() {
        backButton.layer.cornerRadius = backButton.frame.height / 2
    }
    
    @IBAction private func backButtonPressed() {
        dismiss(animated: true)
    }
    

}

extension BitRateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bitRate.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "PopOverColor")
        
        let label = UILabel()
        label.textColor = .opaqueSeparator
        label.text = "Качество музыки"
        label.frame = CGRect(x: 15,
                             y: 3,
                             width: tableView.bounds.size.width - 30,
                             height: view.frame.height / 18)
        
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bitRateCell", for: indexPath)
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(named: "CellColor")
        cell.selectedBackgroundView = selectedView
        
        var content = cell.defaultContentConfiguration()
        content.textProperties.color = .white
        content.secondaryTextProperties.color = .opaqueSeparator
        
    
        
        content.text = bitRate[indexPath.row].title
        content.secondaryText = bitRate[indexPath.row].description
        
        let curLink = BitRateManager.shared.currentLink
        if bitRate[indexPath.row].link == curLink {
            cell.accessoryType = .checkmark
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        BitRateManager.shared.currentLink = bitRate[indexPath.row].link
        print(BitRateManager.shared.currentLink)
        
    }
    
    
}
