//
//  ViewController.swift
//  SwiftStudy-2
//
//  Created by 윤강록 on 2023/09/25.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {

    @IBOutlet weak var myTable: UITableView!
    
    var candys = ["Chocolate Bar", "Chocolate Chip", "Dark Chocolate", "Lollipop", "Candy Cane", "Jaw Breaker", "Caramel", "Sour Chew", "Gummi Bear"]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
 
}

