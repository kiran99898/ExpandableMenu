//
//  FilterVC.swift
//  ExpandableMenu
//
//  Created by kiran on 4/4/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import UIKit

//protocol SendId: NSObjectProtocol {
//    func didSentId(id: Int)
//}



class FilterVC: UIViewController {
    
    @IBOutlet weak var productsTV: UITableView!
    // @IBOutlet weak var fil: UITableView!
    @IBOutlet weak var filheight: NSLayoutConstraint!
    @IBOutlet weak var openFilteredTapped: UIBarButtonItem!
    @IBOutlet weak var fil: ContentSizedTableView!
    
    
    var id:String?{
        didSet{
            print(id)
            array.append(id!)
            productsTV.reloadData()
            fil.isHidden = true
            
        }
    }
    
    var array = ["r", "a"]{
        didSet{
            print(array.count)
        }
    }
    
    
    var isTVHidden = true
    override func viewDidLoad() {
        super.viewDidLoad()
        fil.isHidden = true
        isTVHidden = false
        fil.delegate = self
        fil.dataSource = self
        productsTV.delegate = self
        productsTV.dataSource = self
        
        fil.reloadData()
        
        
        
    }
    
    @IBAction func openFilterMen(_ sender: Any) {
        if isTVHidden{
            fil.fadeOut()
            isTVHidden = false
            
        } else {
            fil.isHidden = false
            isTVHidden = true
            fil.fadeIn()
        }
        
    }
    
}

extension FilterVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                if tableView == fil{
                    let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: fil.frame.size.width - 10, height: 50))
                    headerView.delegate = self
                    headerView.sectionIndx = section
                    headerView.backgroundColor = UIColor.lightGray
                    headerView.btn.setTitle(myData[section].headerName, for: .normal)
                    if myData[section].isExpandable {
                        headerView.downImage.isHidden = true
                    } else {
                        headerView.upImage.isHidden = true
        
                    }
                    return headerView
        
                } else {
                    return UIView()
                }
        
        
//        if tableView == fil {
//
//            let header = fil.dequeueReusableCell(withIdentifier: "FilterByTVCell") as! FilterByTVCell
//            header.txtlb.text = myData[section].headerName
//            if myData[section].isExpandable {
//                print("opened")
//            } else {
//                print("closed")
//            }
//            return header
//        } else {
//            return UIView()
//        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == fil {
            return myData.count
            
        } else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == fil {
            if myData[section].isExpandable {
                return (myData[section].subType?.count)!
            } else {
                return 0
            }
        } else {
            return array.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == fil{
            let cell = fil.dequeueReusableCell(withIdentifier: "FilterByTVCell", for: indexPath) as! FilterByTVCell
            cell.textLabel?.text = myData[indexPath.section].subType![indexPath.row]
            return cell
            
        } else if tableView == productsTV{
            let cell = productsTV.dequeueReusableCell(withIdentifier: "ProductTVCell", for: indexPath) as! ProductTVCell
            cell.textLabel?.text = array[indexPath.row]
            return cell
        } else {
            return  UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == fil {
            id = myData[indexPath.row].headerName
        } else{
            print(indexPath.row)
        }
        
    }
    
    
    
}

//makes the tableheight flexable
final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
}

extension FilterVC: HeaderDelegate {
    func callHeader(indx: Int) {
        myData[indx].isExpandable = !myData[indx].isExpandable
        fil.reloadSections([indx], with: .fade)
    }
    
    
}


extension UIView {
    
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
    }
    
}
