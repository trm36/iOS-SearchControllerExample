//
//  ColorListViewController.swift
//  Search-iOS11
//
//  Created by Taylor Mott on 05-Oct-17.
//  Copyright © 2017 Mott Applications. All rights reserved.
//

import UIKit

class ColorListViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredColors = [Color]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredColors.count
        } else {
            return Color.colors3.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as! ColorTableViewCell
        
        let color: Color
        
        if isFiltering {
            color = filteredColors[indexPath.row]
        } else {
            color = Color.colors3[indexPath.row]
        }
        
        cell.update(with: color)
        
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - Search
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        filteredColors = filterColorsBy(name: searchText)
        tableView.reloadData()
    }
    
    private func filterColorsBy(name searchName: String) -> [Color] {
        let filteredColors = Color.colors3.filter { (testColor) -> Bool in
            return testColor.name.lowercased().contains(searchName.lowercased())
        }
        
        return filteredColors
    }
    
    private var searchBarIsEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
}
