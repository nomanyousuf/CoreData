//
//  TableViewController.swift
//  CoreData2
//
//  Created by Noman Yousuf on 11/3/19.
//  Copyright © 2019 colors. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController{
    
    var device = [Devices]()
    let context = CoreDataStack.shareCoreDataStack.persistentContainer.viewContext
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
    }
    
     override func viewWillAppear(_ animated: Bool) {
        
        let request = NSFetchRequest<Devices>(entityName: "Devices")
        do{
            device = try context.fetch(request)
        }catch let error{
            print(error)
        }

        self.tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return device.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)

        cell.textLabel!.text = device[indexPath.row].name
        cell.detailTextLabel!.text = device[indexPath.row].manufacturer
        
        
        cell.textLabel!.text = device[indexPath.row].name
        cell.detailTextLabel!.text = device[indexPath.row].manufacturer

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? DetailViewController{
            vc.indexRowVal  = self.tableView.indexPathForSelectedRow!.row
        }
        
    }
    

}
