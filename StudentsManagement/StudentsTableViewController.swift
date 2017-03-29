//
//  StudentsTableViewController.swift
//  StudentsManagement
//
//  Created by Trương Thắng on 3/27/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {
    
    @IBOutlet weak var nodataView: UIView!
    @IBOutlet weak var footer: UIView!
    private var hasNoData: Bool = false {
        didSet {
            guard hasNoData != oldValue else {return}
            
            if self.hasNoData {
                self.tableView.tableFooterView = nodataView
                self.tableView.isScrollEnabled = false
                self.editButtonItem.isEnabled = false
            } else {
                self.tableView.tableFooterView = footer
                self.tableView.isScrollEnabled = true
                self.editButtonItem.isEnabled = true
            }
            self.setEditing(false, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nodataView.frame = view.frame
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        hasNoData = DataServices.shared.students.count == 0
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataServices.shared.students.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as! StudentCell
        let student = DataServices.shared.students[indexPath.row]
        cell.nameLabel.text = student.name
        cell.phoneNumberLabel.text = student.phoneNumber
        cell.avatarView.image = student.image
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataServices.shared.removeStudent(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            hasNoData = DataServices.shared.students.count == 0
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
