//
//  InterfaceController.swift
//  TTCheck-wachOS Extension
//
//  Created by Juan Pablo on 11/28/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import WatchKit
import Foundation

protocol InterfaceControllerDelegate{
    func isRed() -> Void
}

class InterfaceController: WKInterfaceController{
  
    @IBOutlet var table: WKInterfaceTable!
    
    var apiServicew: ApiServicew!
    
    var isAnyoneRed: Bool = false
    
    var delegate: InterfaceControllerDelegate?
    
    var apiCheckArray: [ApiDTOw]!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        setTitle("ttcheck")
        
        apiCheckArray = [ApiDTOw]()
        
        self.apiServicew = ApiServicew()
        table.setHidden(false)
        
        self.setupTable()
    }
    
    override func willActivate() {
        super.willActivate()
        self.table.setHidden(false)
        self.setupTable()
        
    }
    func setupTable() {
        
        
        apiServicew.getApiStatus { (response) in
            self.apiCheckArray.removeAll()
            self.apiCheckArray.append(contentsOf: response)
            self.table.setNumberOfRows(self.apiCheckArray.count, withRowType: "tableCell")
            for i in 0 ..< self.apiCheckArray.count {
                let row = self.table.rowController(at: i) as! TableCell
                if let title = self.apiCheckArray[i].apiName,
                    let status = self.apiCheckArray[i].apiStatus?.statusText,
                    let color = self.apiCheckArray[i].getBackgorundColor(){
                    
                    if color == UIColor.red{
                        self.isAnyoneRed = true
                        self.delegate?.isRed()
                        Status.shared.status = "ERROR"
                    }else{
                        Status.shared.status = "OK"
                    }
                    row.statusButton.setBackgroundColor(color)
                    row.labelCell.setText("\(title):")
                }
            }
        }
    }
    

    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}

class TableCell: NSObject {
    
    @IBOutlet var labelCell: WKInterfaceLabel!
    
    @IBOutlet var statusButton: WKInterfaceButton!

}

final class Status {
    
    static let shared = Status()
    
    var status: String?
    
}
