//
//  CommonListCell.swift
//  MallApp
//
//  Created by zouminyi on 9/14/23.
//

import UIKit

class CommonListCell<ItemType>: UITableViewCell {
    var item:ItemType?
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
