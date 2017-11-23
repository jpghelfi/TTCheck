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
    
    fileprivate func loadData() {
        let service = ApiService()
        service.getApiStatus { (response) in
            self.APICheckArray.removeAll()
            self.APICheckArray.append(contentsOf: response)
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        setupRefreshControl()

        setupTableView()
        
        setupNavigation()
        
//        self.tableView.reloadData().
    }
    
    fileprivate func setupRefreshControl() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshController
        } else {
            tableView.addSubview(refreshController)
        }
        self.refreshController.addTarget(self, action: #selector(update), for: .valueChanged)
        self.refreshController.tintColor = .black
        self.refreshController.attributedTitle = NSAttributedString(string: "loading...")
    }
    
    fileprivate func setupTableView() {
        self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "homeCell")
        self.tableView.contentInset = .init(top: 64, left: 0, bottom: 0, right: 0)
    }
    
    fileprivate func setupNavigation() {
        self.title = "ttcheck"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24), NSAttributedStringKey.foregroundColor: UIColor.white]
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .plain, target: self, action: #selector(update))
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    @objc private func refreshData(_ sender: Any) {

    }
    
    @objc private func update(){
        self.loadData()
        self.refreshController.endRefreshing()
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
