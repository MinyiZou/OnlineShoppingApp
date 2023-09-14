//
//  MoreViewController.swift
//  MallApp
//
//  Created by zouminyi on 9/13/23.
//

import UIKit
import SnapKit

class MoreViewController: BaseViewController {
    
    var accountCell: CommonCell!
    var purchasedCell: CommonCell!
    var dealCell: CommonCell!
    var groupCell: CommonCell!
    var avatarView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopViews()
        setupCells()
    }
    
    private func setupTopViews() {
        let topView = UIView()
        topView.backgroundColor = .white
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(160)
        }
        
        avatarView = UIImageView(image: R.image.defaultAvatarJpg())
        avatarView.layer.cornerRadius = 60
        avatarView.clipsToBounds = true
        topView.addSubview(avatarView)
        avatarView.snp.makeConstraints { make in
            make.left.top.equalTo(20)
            make.width.height.equalTo(120)
        }
        
        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("Click to login", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        loginButton.setTitleColor(UIColor.primaryGrey, for: .normal)
        loginButton.addTarget(self, action: #selector(handleLoginButtonPress), for: .touchUpInside)
        topView.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(15)
            make.centerY.equalTo(avatarView)
        }
    }
    
    @objc private func handleLoginButtonPress() {
        let loginVC = LoginViewController()
        loginVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc private func handlePurchasedCellPress() {
        let dealVC = DealListViewController()
        dealVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(dealVC, animated: true)
    }
    
    private func setupCells() {
        accountCell = createCell(withIcon: R.image.icon_life(), title: "Account")
        accountCell.snp.makeConstraints { make in
            make.top.equalTo(170)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        purchasedCell = createCell(withIcon: R.image.icon_between(), title: "Purchased")
        purchasedCell.addTarget(self, action: #selector(handlePurchasedCellPress), for: .touchUpInside)
        purchasedCell.snp.makeConstraints { make in
            make.top.equalTo(accountCell.snp_bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        dealCell = createCell(withIcon: R.image.icon_live(), title: "Mall Orders")
        dealCell.snp.makeConstraints { make in
            make.top.equalTo(purchasedCell.snp_bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        groupCell = createCell(withIcon: R.image.icon_document(), title: "My Group Purchase")
        groupCell.snp.makeConstraints { make in
            make.top.equalTo(dealCell.snp_bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
    }
    
    private func createCell(withIcon icon: UIImage?, title: String) -> CommonCell {
        let cell = CommonCell()
        cell.icon = icon
        cell.title = title
        view.addSubview(cell)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = false
    }
}
