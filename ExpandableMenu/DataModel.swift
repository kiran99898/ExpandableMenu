//
//  DataModal.swift
//  ExpMenu
//
//  Created by kiran on 1/1/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import Foundation

class DataModal {
    
    var headerName: String?
    var subType: [String]?
    var isExpandable: Bool
    
    
    init(headerName: String, subType: [String ], isExpandable: Bool) {
        self.headerName = headerName
        self.subType = subType
        self.isExpandable = isExpandable
    }
    
    
    
    
}
