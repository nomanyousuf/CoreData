
//
//  DetailViewController.swift
//  CoreData2
//
//  Created by Noman Yousuf on 11/3/19.
//  Copyright © 2019 colors. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UITextFieldDelegate, NSFetchedResultsControllerDelegate  {

    let context = CoreDataStack.shareCoreDataStack.persistentContainer.viewContext
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var manufacturerTextField: UITextField!
    
    var indexRowVal = Int()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.manufacturerTextField.delegate = self

        let request = NSFetchRequest<Devices>(entityName: "Devices")
        //let entity = NSEntityDescription.entity(forEntityName: "Devices", in: context)
        
               do{
                   var device = try context.fetch(request)[indexRowVal]
                modelTextField.text = device.model
                manufacturerTextField.text = device.manufacturer
                nameTextField.text = device.name
                
                CoreDataStack.shareCoreDataStack.saveContext()
               }catch let error{
                   print(error)
               }
    }
    

    @IBAction func updateActionBtn(_ sender: Any) {
        
        let request = NSFetchRequest<Devices>(entityName: "Devices")
               let entity = NSEntityDescription.entity(forEntityName: "Devices", in: context)
               
                      do{
                          var device = try context.fetch(request)[indexRowVal]
                       device.model = modelTextField.text!
                       device.manufacturer = manufacturerTextField.text!
                       device.name = nameTextField.text!
                       
                       CoreDataStack.shareCoreDataStack.saveContext()
                      }catch let error{
                          print(error)
                      }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
