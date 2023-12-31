//
//  ProductList.swift
//  MallApp
//
//  Created by zouminyi on 9/14/23.
//

import UIKit
import SnapKit

class ProductCell: CommonListCell<Product>{
    let priceLabel: UILabel
    let productImageView: UIImageView
       
    override var item: Product? {
           didSet {
               if let p = self.item {
                   self.productImageView.kf.setImage(with: URL(string: p.imageUrl))
                   self.textLabel?.text = p.name
                   self.detailTextLabel?.text = p.desc
                   self.priceLabel.text = "￥\(p.price)"
               }
           }
       }
       
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           priceLabel = UILabel(frame: .zero)
           productImageView = UIImageView()
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           self.setupViews()
       }
       
       private func setupViews() {
           textLabel?.textColor = UIColor.primaryButtonStyle
           detailTextLabel?.textColor = UIColor.primaryGrey
           detailTextLabel?.numberOfLines = 2
           priceLabel.textColor = UIColor.primaryLabelText
           priceLabel.font = UIFont.systemFont(ofSize: 15)
           productImageView.contentMode = .scaleAspectFill
           productImageView.clipsToBounds = true
           
           contentView.addSubview(priceLabel)
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
           
           priceLabel.snp.makeConstraints { (make) in
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
