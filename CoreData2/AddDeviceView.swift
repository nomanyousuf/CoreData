 //
//  AddDeviceView.swift
//  CoreData2
//
//  Created by Noman Yousuf on 11/3/19.
//  Copyright © 2019 colors. All rights reserved.
//

import UIKit
import CoreData

class AddDeviceView: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var manufacturerTextField: UITextField!
    
    
    
    @IBAction func addActionBtn(_ sender: Any) {
          
        let devices = NSEntityDescription.insertNewObject(forEntityName: "Devices", into: CoreDataStack.shareCoreDataStack.persistentContainer.viewContext) as! Devices
        
        
        devices.name = nameTextField.text!
        devices.model = modelTextField.text!
        devices.manufacturer = manufacturerTextField.text!
        
        CoreDataStack.shareCoreDataStack.saveContext()
        
        self.dismiss(animated: true, completion: nil)
        
        
        
          
      }
      
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
      
        
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
