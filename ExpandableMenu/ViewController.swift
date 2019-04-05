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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.tableFooterView = UIView()
        
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
  /*
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: myTableView.frame.size.width - 50, height: 40))
        headerView.delegate = self
        headerView.sectionIndx = section
        headerView.btn.setTitle(myData[section].headerName, for: .normal)
        if myData[section].isExpandable {
            headerView.downImage.isHidden = true
        } else {
            headerView.upImage.isHidden = true
            
        }
        return headerView
    }
 */
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        print(indexPath.row)
    }
    
    
}

extension ViewController: HeaderDelegate {
    func callHeader(indx: Int) {
        myData[indx].isExpandable = !myData[indx].isExpandable
        myTableView.reloadSections([indx], with: .fade)
    }
    
    
    
    /*
     ***Storm Victims Of Bara and Parsa: Waiting For Relief***
     
     The headline is in trending nowdays and I suppose We all are very much aware of the diseaster . so I think we can make some contribution to make the pain go away . So lets do it .
     
     According to my plan , lets collect RS 500 each or the amount as your wish and diposit the sum to the victims bank account .
     
      Please write + if you are in or - if you are not and  lets start collecting the sum .
     "Trust me you will feel good "
     
     Thank You .
     
     
     
     
     
     
     */
    
}



