//
//  SectionCustomee.swift
//  ExpandableMenu
//
//  Created by kiran on 1/1/19.
//  Copyright © 2019 kiran. All rights reserved.
//
/*
import UIKit


protocol HeaderDelegate {
    func callHeader(indx: Int)
}


class SectionCustomee: UITableViewCell {
    @IBOutlet weak var sectiontitle: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var sectionIndx: Int?
    var delegate: HeaderDelegate?
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.addSubview(btn)
//
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc
    func headerTapped() {
        print("section header tapped ")
        if let indx = sectionIndx {
            delegate?.callHeader(indx: indx)
        }
    }

    
}
*/
