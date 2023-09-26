//
//  ViewController.swift
//  SwiftStudy-2
//
//  Created by 윤강록 on 2023/09/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.layer.borderWidth = 0
//        searchBar.layer.borderColor = UIColor.red.cgColor
        
    }

}

