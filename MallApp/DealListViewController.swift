//
//  DealListViewController.swift
//  MallApp
//
//  Created by zouminyi on 9/14/23.
//

import UIKit

class DealListViewController: UIViewController, CommonListDelegate {
    func didSelect<Item>(_ item: Item) {
        //    todo
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let productList = CommonList<Deal, DealListCell>(frame: .zero)
        productList.items = FakeData.createDeals()
        productList.delegate = self
        view.addSubview(productList)
        productList.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
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
