//
//  CountryDialCodeVC.swift
//  CountryDialCode
//
//  Created by Rajeshkumar on 19/05/18.
//  Copyright © 2018 Rajeshkumar. All rights reserved.
//

import UIKit

//MARK: - CountryPickerDelegate
protocol CountryPickerDelegate {
    func didSelectCountry(countryName : String , countryCode : String)
}

//MARK: - UITableViewDelegate , UITableViewDataSource
extension CountryDialCodeVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.filteredItems.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = self.filteredItems[indexPath.row].name
        cell.detailTextLabel?.text = self.filteredItems[indexPath.row].dialCode
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
        let item = filteredItems[indexPath.row]
        // print(" \(item.name) : \(item.size) selected")
        
        if countryDelegate != nil {
            countryDelegate?.didSelectCountry(countryName: item.name, countryCode: item.dialCode)
        }
        
        self.dismiss(animated: true) {
            self.dismiss(animated: true, completion: nil)
        }
        //   self.presentingViewController?.dismiss(animated: true, completion: nil)
        
        
        
    }
}

//MARK: - UISearchResultsUpdating
extension CountryDialCodeVC : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredItems = Helper.shared.items
        } else {
            // Filter the results
            filteredItems = Helper.shared.items.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        
        self.tableView.reloadData()
    }
}
class CountryDialCodeVC: UIViewController {
    //MARK: - IBOutlet Properties
    @IBOutlet weak var tableView: UITableView!
   
     //MARK: - Properties
    var countryDelegate : CountryPickerDelegate?
    var filteredItems = [Item]()
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Helper.shared.addItem()
        filteredItems = Helper.shared.items
        setupView()
    }
    
    //MARK: - Custom Action
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}
