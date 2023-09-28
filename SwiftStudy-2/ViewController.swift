//
//  ViewController.swift
//  SwiftStudy-2
//
//  Created by 윤강록 on 2023/09/25.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var myTable: UITableView!
    
    var candys = ["Chocolate Bar", "Chocolate Chip", "Dark Chocolate", "Lollipop", "Candy Cane", "Jaw Breaker", "Caramel", "Sour Chew", "Gummi Bear"]
    
    var searching = false
    var searchedCandys = [String]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search"
        
    }
}
  
extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty
        {
            searching = true
            searchedCandys.removeAll()
            for candy in candys
            {
                if candy.lowercased().contains(searchText.lowercased())
                {
                    searchedCandys.append(candy)
                }
            }
        }
        else
        {
            searching = false
            searchedCandys.removeAll()
            searchedCandys = candys
        }
        myTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return searchedCandys.count
        }
        else
        {
            return candys.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching
        {
            cell.textLabel?.text = searchedCandys[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = candys[indexPath.row]
        }
        return cell
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedCandys.removeAll()
        myTable.reloadData()
    }
         
}
    
    

 


