//
//  HomeTableViewController.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/19/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import UIKit
import PureLayout
import SwipeCellKit

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
        
        self.setupNavigation()

        self.view.backgroundColor = UIColor.getLightGrayColor()
        
        self.loadData()
        
        self.setupRefreshControl()

        self.setupTableView()
        
    }
    
    fileprivate func setupRefreshControl() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshController
        } else {
            tableView.addSubview(refreshController)
        }
        self.refreshController.addTarget(self, action: #selector(update), for: .valueChanged)
        self.refreshController.tintColor = .black
//        self.refreshController.attributedTitle = NSAttributedString(string: "loading...")
    }
    
    fileprivate func setupTableView() {
       
        self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "homeCell")
        self.tableView.register(AddMonitorTableViewCell.self, forCellReuseIdentifier: "addMonitorCell")
        
        self.tableView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.separatorStyle = .none
    }
    
    fileprivate func setupNavigation() {
        self.title = "ttcheck"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24), NSAttributedStringKey.foregroundColor: UIColor.white]
        
        UIApplication.shared.isStatusBarHidden = false

//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .plain, target: self, action: #selector(update))
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
        let navImage = UIImage(named: "navigationBackground")
        self.navigationController?.navigationBar.setBackgroundImage(navImage, for: .default)
//        self.navigationController?.navigationBar.backgroundColor = UIColor.getLightGrayColor()
//        self.navigationController?.view.backgroundColor = UIColor.clear
        
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
//        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: 320, height: 200)
    }
    
    @objc private func update(){
        self.loadData()
        let when = DispatchTime.now() + 0.5 // change to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
    
            self.refreshController.endRefreshing()
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APICheckArray.count + 1
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let action = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            let deleteService = MonitorService()
            if let id = self.APICheckArray[indexPath.row].id{
                let theId = String(describing: id)
                deleteService.deleteMonitorWith(id: theId, completion: { (response) in

                    self.APICheckArray.remove(at: indexPath.row)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                })
            }
        }
        action.backgroundColor = UIColor.red
        
        return [action]
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == APICheckArray.endIndex{
        
            present(AddMonitorViewController(), animated: true, completion: {
                
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row != APICheckArray.endIndex{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath)
            let api = APICheckArray[indexPath.row]
            if let homeCell = cell as? HomeTableViewCell {
                
                homeCell.setupCell(api: api)
            }
    
            return cell
        }else if indexPath.row == APICheckArray.endIndex{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "addMonitorCell", for: indexPath)
            if let addMonitorCell = cell as? AddMonitorTableViewCell {
                
                addMonitorCell.setupCell()
            }
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
//    @available(iOS 11.0, *)
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let modifyAction = UIContextualAction(style: .destructive, title:  "Update", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//            print("Update action ...")
//            success(true)
//        })
//        modifyAction.image = UIImage(named: "hammer")
//        modifyAction.backgroundColor = .blue
//
//        return UISwipeActionsConfiguration(actions: [modifyAction])
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupRefreshControl()
        self.update()
    }
    
}



