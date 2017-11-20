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

    var APICheckArray = [ApiDTO]()
    
    var api1 = ApiDTO()
    var api2 = ApiDTO()
    var status1 = StatusDTO(status: true)
    var status2 = StatusDTO(status: false)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "homeCell")
        self.tableView.contentInset = .init(top: 64, left: 0, bottom: 0, right: 0)
        self.title = "ttcheck"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .plain, target: self, action: #selector(update))

        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }

        api1.apiName = "TTSocial"
        api1.lastTimeCheck = "Sabado"
        api1.apiStatus = status1
        
        APICheckArray.append(api1)
        
        api2.apiName = "TTSocial"
        api2.lastTimeCheck = "Sabado"
        api2.apiStatus = status2
        
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
        self.tableView.reloadData()
        

        
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
        
        return 100
    }
    
}
