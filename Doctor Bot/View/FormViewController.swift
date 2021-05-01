//
//  FormViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 30/01/21.
//

import UIKit

class FormViewController: UIViewController {
    
    var report:Report?
    var update = false

    @IBOutlet weak var deleteBtn:UIButton!
    @IBOutlet weak var addBtn:UIButton!
    
    @IBOutlet weak var issueField: UITextField!
    @IBOutlet weak var doctorNameField: UITextField!
    @IBOutlet weak var medicineField: UITextField!
    @IBOutlet weak var bloodTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if update == true {
            issueField.text = report!.issue
            doctorNameField.text = report!.doctor
            medicineField.text = report!.medicine
        }
    }
    
    @IBAction func backButton(_ sender: Any){
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func deleteButton(_ sender: Any){
        
        APIFunctions.functions.deleteReport(id: report!._id)
        
    }
    @IBAction func addButton(_ sender: Any){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: Date())
        
        if (medicineField.text != "" && doctorNameField.text != "" && issueField.text != "" && bloodTextField.text != ""){
            
            if update == true {
                APIFunctions.functions.updateReport(date: currentDate, doctorName: doctorNameField.text!, issue: issueField.text!, medicine: medicineField.text!, id: report!._id)
            }
            else{
                
                APIFunctions.functions.addReport(date: currentDate, doctorName: doctorNameField.text!, issue: issueField.text!, medicine: medicineField.text!, blood: bloodTextField.text!)
            }
        }
        else{
            
            let alert = UIAlertController(title: "Error!", message: "Fields are empty!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if update == false {
            deleteBtn.isEnabled = false
            
        }
    }
}
