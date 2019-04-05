//
//  FilterByTVCell.swift
//  ExpandableMenu
//
//  Created by kiran on 4/4/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import UIKit

class FilterByTVCell: UITableViewCell {
    @IBOutlet weak var txtlb: UILabel!
    
    @IBOutlet weak var imgV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func getCellData(tit: String, img: UIImage){
        
        txtlb.text = tit
        imgV.image = img
    }
}
