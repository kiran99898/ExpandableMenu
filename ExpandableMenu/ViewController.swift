//
//  ViewController.swift
//  ExpMenu
//
//  Created by kiran on 1/1/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var myData = [DataModal(headerName: "Men", subType: ["Tshirts", "Shoes", "Pant"], isExpandable: false),
                  DataModal(headerName: "Women", subType: ["MakeUp", "Shocks", "Shorts", "Bag", "Tag"], isExpandable: false),
                  DataModal(headerName: "Children", subType: ["Book", "Shoes", "Cap"], isExpandable: false),
                  DataModal(headerName: "Kitchen", subType: ["Cooker", "Pan", "Rice"], isExpandable: false),
                  DataModal(headerName: "Sports", subType: ["Phone", "Laptop", "Data", "Copy", "Paste"], isExpandable: false),
                   DataModal(headerName: "Office", subType: ["Phone", "Laptop", "Data", "Copy", "Paste"], isExpandable: false),
                    DataModal(headerName: "Vehicke", subType: ["Phone", "Laptop", "Data", "Copy", "Paste"], isExpandable: false)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.tableFooterView = UIView()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: myTableView.frame.size.width, height: 40))
        headerView.delegate = self
        headerView.sectionIndx = section
        headerView.btn.setTitle(myData[section].headerName, for: .normal)
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return myData.count
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if myData[section].isExpandable {
            return (myData[section].subType?.count)!
        } else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = myData[indexPath.section].subType![indexPath.row]
        return cell
    }
    
    
}

extension ViewController: HeaderDelegate {
    func callHeader(indx: Int) {
        myData[indx].isExpandable = !myData[indx].isExpandable
        myTableView.reloadSections([indx], with: .fade)
    }
    
    
}



