//
//  Tab.swift
//  MallApp
//
//  Created by zouminyi on 9/14/23.
//

import UIKit
import SnapKit
import Kingfisher

class Tab: UIView {
    var items: [String]
    var itembuttons: [UIButton]!
    var selectedItemButton: UIButton!
    
    var indicatorView: UIView!
    var selectedColor: UIColor? {
        didSet {
            if let color = self.selectedColor {
                self.indicatorView.backgroundColor = color
                itembuttons.forEach { button in
                    button.setTitleColor(color, for: .selected)
                }
            } else {
                self.indicatorView.backgroundColor = .primaryButtonStyle
                itembuttons.forEach { button in
                    button.setTitleColor(.primaryButtonStyle, for: .selected)
                }
            }
        }
    }
    var normalColor: UIColor?
    
    init?(items: [String]) {
        if items.count == 0 {
            return nil
        }
        self.items = items
        itembuttons = []
        super.init(frame: .zero)
        self.createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        var lastView: UIView?
        for index in 0..<items.count {
            let button = UIButton(type: .custom)
            button.setTitle(items[index], for: .normal)
            button.setTitleColor(UIColor.primaryNavigationBarText, for: .normal)
            button.setTitleColor(UIColor.primaryButtonStyle, for: .selected)
            self.addSubview(button)
            
            if index == 0 {
                selectedItemButton = button
            }
            
            button.snp.makeConstraints { make in
                if index == 0 {
                    make.left.equalToSuperview()
                } else {
                    make.left.equalTo(lastView!.snp.right)
                    make.width.equalTo(lastView!)
                }
                make.top.bottom.equalToSuperview()
                if index == items.count - 1 {
                    make.right.equalToSuperview()
                }
            }
            lastView = button
            button.addTarget(self, action: #selector(didClick(sender:)), for: .touchUpInside)
            itembuttons.append(button)
        }
        
        indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.primaryButtonStyle
        self.addSubview(indicatorView)
        
        indicatorView.snp.makeConstraints { make in
            make.centerX.equalTo(selectedItemButton)
            make.bottom.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(4)
        }
        
    }
    
    @objc func didClick(sender: UIButton) {
        guard sender != selectedItemButton else {
            return
        }
        
        selectedItemButton.isSelected = false
        sender.isSelected = true
        selectedItemButton = sender
        UIView.animate(withDuration: 3, delay: 0) {
            self.indicatorView.snp.remakeConstraints { make in
                make.centerX.equalTo(self.selectedItemButton)
                make.bottom.equalToSuperview()
                make.width.equalTo(80)
                make.height.equalTo(4)
            }
        }
    }
}
