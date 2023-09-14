//
//  DetailsViewController.swift
//  MallApp
//
//  Created by zouminyi on 9/14/23.
//

import UIKit
import Kingfisher
import SnapKit

class DetailViewController: BaseViewController {

    var product: Product!
    var avatarView: UIImageView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    var teacherLabel: UILabel!
    var courseCountLabel: UILabel!
    var studentCountLabel: UILabel!
    var tab: Tab!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        setupTop()
        setupMiddle()
        setupBottom()
    }
    
    private func setupBottom() {
        let purchaseButton = UIButton(type: .custom)
        purchaseButton.setTitleColor(.white, for: .normal)
        purchaseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        purchaseButton.setTitle("Buy for \(product.price)¥", for: .normal)
        purchaseButton.setBackgroundImage(UIColor.primaryButtonStyle.toImage(), for: .normal)
        purchaseButton.addTarget(self, action: #selector(didTapBuyButton), for: .touchUpInside)
        view.addSubview(purchaseButton)
        
        purchaseButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    @objc private func didTapBuyButton() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    private func setupMiddle() {
        tab = Tab(items: ["Course Introduction", "Course Directory"])
        view.addSubview(tab)
        
        tab.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    private func setupTop() {
        let topView = UIView()
        topView.layer.contents = R.image.detailBg()?.cgImage
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.layer.masksToBounds = true
        blurView.alpha = 0.7
        view.addSubview(topView)
        topView.addSubview(blurView)
        
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(200)
        }
        
        setupAvatar(in: topView)
        setupNameLabel(in: topView)
        setupDescriptionLabel(in: topView)
        setupTeacherLabel(in: topView)
        setupCourseCountLabel(in: topView)
        setupStudentCountLabel(in: topView)
    }
    
    private func setupAvatar(in view: UIView) {
        avatarView = UIImageView()
        let roundedCornerProcessor = RoundCornerImageProcessor(cornerRadius: 10)
        avatarView.kf.setImage(with: URL(string: product.imageUrl), options: [.processor(roundedCornerProcessor)])
        view.addSubview(avatarView)
        
        avatarView.snp.makeConstraints { make in
            make.left.top.equalTo(view).offset(20)
            make.width.equalTo(82)
            make.height.equalTo(108)
        }
    }
    
    private func setupNameLabel(in view: UIView) {
        nameLabel = UILabel()
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.text = product.name
        view.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(10)
            make.top.equalTo(avatarView)
            make.right.equalTo(view).offset(-15)
        }
    }
    
    private func setupDescriptionLabel(in view: UIView) {
        descriptionLabel = UILabel()
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.text = product.desc
        descriptionLabel.numberOfLines = 2
        view.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.right.equalTo(view).offset(-15)
        }
    }
    
    private func setupTeacherLabel(in view: UIView) {
        teacherLabel = UILabel()
        teacherLabel.textColor = .white
        teacherLabel.font = UIFont.systemFont(ofSize: 14)
        teacherLabel.text = "Instructor: \(product.teacher)"
        view.addSubview(teacherLabel)
        
        teacherLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(10)
            make.bottom.equalTo(avatarView)
            make.right.equalTo(view).offset(-15)
        }
    }
    
    private func setupCourseCountLabel(in view: UIView) {
        let bookAttachment = NSTextAttachment()
        bookAttachment.image = R.image.book()
        bookAttachment.bounds = CGRect(x: -2, y: -3, width: bookAttachment.image?.size.width ?? 0, height: bookAttachment.image?.size.height ?? 0)
        
        let courseCountString = NSMutableAttributedString(attachment: bookAttachment)
        let courseCountStringAfterIcon = NSAttributedString(string: " Total \(product.total) lectures, updated to \(product.update) lectures")
        courseCountString.append(courseCountStringAfterIcon)
        
        courseCountLabel = UILabel()
        courseCountLabel.textColor = .white
        courseCountLabel.font = UIFont.systemFont(ofSize: 14)
        courseCountLabel.attributedText = courseCountString
        view.addSubview(courseCountLabel)
        
        courseCountLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.bottom.equalTo(view).offset(-15)
        }
    }
    
    private func setupStudentCountLabel(in view: UIView) {
        let studentAttachment = NSTextAttachment()
        studentAttachment.image = R.image.student()
        studentAttachment.bounds = CGRect(x: -2, y: -3, width: studentAttachment.image?.size.width ?? 0, height: studentAttachment.image?.size.height ?? 0)
        
        let studentCountString = NSMutableAttributedString(attachment: studentAttachment)
        let studentCountStringAfterIcon = NSAttributedString(string: " \(product.studentCount) students enrolled")
        studentCountString.append(studentCountStringAfterIcon)
        
        studentCountLabel = UILabel()
        studentCountLabel.textColor = .white
        studentCountLabel.font = UIFont.systemFont(ofSize: 14)
        studentCountLabel.attributedText = studentCountString
        view.addSubview(studentCountLabel)
        
        studentCountLabel.snp.makeConstraints { make in
            make.right.equalTo(view).offset(-20)
            make.bottom.equalTo(view).offset(-15)
        }
    }
}

