//
//  LoginViewController.swift
//  MallApp
//
//  Created by zouminyi on 9/12/23.
//

import UIKit
import SnapKit

protocol ValidatePhoneNumber {
    func isValid(phoneNumber: String) -> Bool
}

protocol ValidatePassword {
    func isValid(password: String) -> Bool
}

extension ValidatePhoneNumber {
    func isValid(phoneNumber: String) -> Bool {
        return phoneNumber.count == 11
    }
}

extension ValidatePassword {
    func isValid(password: String) -> Bool {
        return (6...12).contains(password.count)
    }
}


class LoginViewController: BaseViewController, ValidatePhoneNumber, ValidatePassword {
    
    // MARK: - Constants
    private struct Constants {
        static let logoTopOffset: CGFloat = 30
        static let textFieldSideOffset: CGFloat = 20
        static let textFieldHeight: CGFloat = 50
        static let textFieldVerticalSpacing: CGFloat = 10
        static let textFieldBorderWidth: CGFloat = 1
        static let textFieldCornerRadius: CGFloat = 5
        static let buttonHeight: CGFloat = 50
        static let buttonFont: CGFloat = 30
    }
    
    private let logoView = UIImageView(image: R.image.logo())
    private var phoneTextField: UITextField!
    private var passwordTextField: UITextField!
    private let loginButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        setupLogoView()
        setupPhoneTextField()
        setupPasswordTextField()
        setupLoginButton()
    }
    
    private func setupLogoView() {
        view.addSubview(logoView)
        
        logoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.logoTopOffset)
            make.centerX.equalToSuperview()
        }
    }

    private func setupPhoneTextField() {
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        
        phoneTextField = createTextField(with: phoneIconView, placeholder: "Enter your phone number")
        view.addSubview(phoneTextField)
        
        phoneTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Constants.textFieldSideOffset)
            make.right.equalToSuperview().offset(-Constants.textFieldSideOffset)
            make.top.equalTo(logoView.snp_bottom).offset(Constants.textFieldVerticalSpacing)
            make.height.equalTo(Constants.textFieldHeight)
        }
    }
    
    private func setupPasswordTextField() {
        let passwordIconView = UIImageView(image: R.image.icon_pwd())
        passwordTextField = createTextField(with: passwordIconView, placeholder: "Enter your password")
        passwordTextField.isSecureTextEntry = true
        
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.left.right.equalTo(phoneTextField)
            make.top.equalTo(phoneTextField.snp_bottom).offset(Constants.textFieldVerticalSpacing)
            make.height.equalTo(Constants.textFieldHeight)
        }
    }
    
    private func createTextField(with leftView: UIView?, placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.primaryNavigationBarText.cgColor
        textField.layer.borderWidth = Constants.textFieldBorderWidth
        textField.textColor = .primaryNavigationBarText
        textField.layer.cornerRadius = Constants.textFieldCornerRadius
        textField.layer.masksToBounds = true
        textField.placeholder = placeholder
        return textField
    }
    
    
    private func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setBackgroundImage(UIColor.primaryButtonStyle.toImage(), for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.buttonFont)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = Constants.textFieldCornerRadius
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)

        view.addSubview(loginButton)

        loginButton.snp.makeConstraints { make in
           make.left.right.equalTo(phoneTextField)
           make.top.equalTo(passwordTextField.snp.bottom).offset(Constants.textFieldVerticalSpacing)
           make.height.equalTo(Constants.buttonHeight)
        }
   }
    
    @objc private func login() {
        if isValid(phoneNumber: phoneTextField.text ?? "") && isValid(password: passwordTextField.text ?? "") {
            // todo: handle success
        } else {
            self.presentErrorAlert()
        }
    }

    func presentErrorAlert() {
        let alertController = UIAlertController(title: "Error",
                                                message: "Wrong username or password",
                                                preferredStyle: .alert)
        present(alertController, animated: true) {
            self.dismissAlert(alertController, after: 2)
        }
    }

    func dismissAlert(_ alert: UIAlertController, after seconds: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
