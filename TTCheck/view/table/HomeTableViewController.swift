//
//  HomeTableViewController.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/19/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import UIKit
import PureLayout

class HomeTableViewController: UITableViewController {

    internal let refreshController = UIRefreshControl()
    
    var APICheckArray = [ApiDTO]()
    
    var api1 = ApiDTO()
    
    var api2 = ApiDTO()
    
    var status1 = StatusDTO(status: true)
    
    var status2 = StatusDTO(status: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupRefreshControl()

        setupTableView()
        
        setupNavigation()

        loadData()
        
        self.tableView.reloadData()
    }
    
    fileprivate func setupRefreshControl() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshController
        } else {
            tableView.addSubview(refreshController)
        }
        self.refreshController.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        self.refreshController.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        self.refreshController.attributedTitle = NSAttributedString(string: "Fetching...")
    }
    
    fileprivate func setupTableView() {
        self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "homeCell")
        self.tableView.contentInset = .init(top: 64, left: 0, bottom: 0, right: 0)
    }
    
    fileprivate func setupNavigation() {
        self.title = "ttcheck"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24), NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .plain, target: self, action: #selector(update))
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    fileprivate func loadData() {
        api1.apiName = "TTSocial"
        api1.lastTimeCheck = "22-04-2017"
        api1.apiStatus = status1
        api2.apiName = "Instagram"
        api2.lastTimeCheck = "12-11-2017"
        api2.apiStatus = status2
        
        APICheckArray.append(api1)
        APICheckArray.append(api1)
        APICheckArray.append(api2)
        APICheckArray.append(api2)
        APICheckArray.append(api1)
        APICheckArray.append(api2)
        APICheckArray.append(api2)
        APICheckArray.append(api2)
        APICheckArray.append(api1)
        APICheckArray.append(api2)
        APICheckArray.append(api2)
    }
    
    @objc private func refreshData(_ sender: Any) {
        // Fetch Weather Data
        self.tableView.reloadData()
        self.refreshController.endRefreshing()
//        self.activityIndicatorView.stopAnimating()
        
    }
    
    @objc private func update(){
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APICheckArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath)
        let api = APICheckArray[indexPath.row]
           if let homeCell = cell as? HomeTableViewCell {
        
                homeCell.setupCell(api: api)
            }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
