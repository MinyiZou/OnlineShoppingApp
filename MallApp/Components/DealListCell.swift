//
//  File.swift
//  MallApp
//
//  Created by zouminyi on 9/14/23.
//

import UIKit
import SnapKit

class DealListCell: CommonListCell<Deal> {
    
    let progressLabel: UILabel
    let productImageView: UIImageView
       
    override var item: Deal? {
           didSet {
               if let p = self.item {
                self.productImageView.kf.setImage(with: URL(string: p.product.imageUrl))
                self.textLabel?.text = p.product.name
                self.detailTextLabel?.text = p.product.desc
                self.progressLabel.text = "Learnt \(p.progress)%"
               }
           }
       }
       
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           progressLabel = UILabel(frame: .zero)
           productImageView = UIImageView()
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           self.setupViews()
       }
       
       private func setupViews() {
           textLabel?.textColor = UIColor.primaryGrey
           detailTextLabel?.textColor = UIColor.primaryGrey
           detailTextLabel?.numberOfLines = 2
           progressLabel.textColor = UIColor.primaryGrey
           progressLabel.font = UIFont.systemFont(ofSize: 15)
           productImageView.contentMode = .scaleAspectFill
           productImageView.clipsToBounds = true
           
           contentView.addSubview(progressLabel)
           contentView.addSubview(productImageView)
           
           productImageView.snp.makeConstraints({ (make) in
               make.left.equalTo(contentView).offset(20)
               make.top.equalTo(contentView).offset(10)
               make.width.equalTo(80)
               make.height.equalTo(100)
           })
           
           textLabel?.snp.makeConstraints({ (make) in
               make.left.equalTo(productImageView.snp_right).offset(12)
               make.top.equalTo(productImageView)
               make.right.equalTo(contentView).offset(-20)
           })
           
           progressLabel.snp.makeConstraints { (make) in
               make.left.equalTo(textLabel!)
               make.centerY.equalTo(contentView)
           }
           
           detailTextLabel?.snp.makeConstraints({ (make) in
               make.left.equalTo(textLabel!)
               make.bottom.equalTo(productImageView)
               make.right.equalTo(contentView).offset(-20)
           })
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
