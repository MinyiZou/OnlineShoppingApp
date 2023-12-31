//
//  CommonList.swift
//  MallApp
//
//  Created by zouminyi on 9/14/23.
//

import Foundation
import UIKit
import SnapKit

protocol CommonListDelegate: AnyObject {
    func didSelect<Item>(_ item: Item)
}

class CommonList<ItemType, CellType: CommonListCell<ItemType>>: UIView, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView
    
    weak var delegate: CommonListDelegate?
    
    var items: [ItemType]! = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero, style: .plain)
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? CellType
        if cell == nil {
            cell = CellType(style: .subtitle, reuseIdentifier: "cellID")
        }
        cell?.item = items[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
