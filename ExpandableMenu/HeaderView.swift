//
//  HeaderView.swift
//  ExpMenu
//
//  Created by kiran on 1/1/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import UIKit

protocol HeaderDelegate {
    func callHeader(indx: Int)
}


class HeaderView: UIView {
    
    var sectionIndx: Int?
    var delegate: HeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var btn:UIButton = {
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        btn.backgroundColor = UIColor.lightGray
        btn.titleLabel?.textColor = UIColor.white
        btn.addTarget(self, action: #selector(headerTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc
    func headerTapped() {
        print("section header tapped ")
        if let indx = sectionIndx {
            delegate?.callHeader(indx: indx)
        }
    }
}
