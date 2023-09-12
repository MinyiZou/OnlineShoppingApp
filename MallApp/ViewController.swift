//
//  ViewController.swift
//  MallApp
//
//  Created by zouminyi on 9/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = UIButton(type: .custom)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .primaryButtonStyle
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)

        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.left.top.equalTo(100)
            make.width.equalTo(100)
        }
    }

    @objc private func login() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

}

