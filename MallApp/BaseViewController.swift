//
//  BaseViewController.swift
//  MallApp
//
//  Created by zouminyi on 9/12/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationBar()
    }
    
    private func setupView() {
       view.backgroundColor = UIColor.primaryBackground
       edgesForExtendedLayout = []
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.primaryNavigationBarText]
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
