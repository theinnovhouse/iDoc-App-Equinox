//
//  MedicineBotViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 29/01/21.
//

import UIKit
import CoreML
import Loafjet

class MedicineBotViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let MedBotClassifier = MedicineBot()
    
    var searches:[String] = ["Acetaminophen","Adderall","Amitriptyline","Amlodipine","Amoxicillin","Atorvastatin."]
    var new = ["treat acne vulgaris","treatment of dry scaly skin disorders of the scalp","Mild to moderate acne (spots)","combined with anti-acne actives of both natural and synthetic origin","relief from itching","treat Acne which often refer to as pimples or spots"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 20
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
            Loaf.GradientLoaf(Message: "Medi-Bot", Position: .bottom, LoafWidth: 200, LoafHeight: 40, CornerRadius: 20, FontStyle: "Avenir-Medium", FontSize: 16, BGColor1: .systemGreen, BGColor2: .systemOrange, FontColor: .black, LoafImage: nil, AnimationDirection: .Bottom, Duration: 4, LoafjetView: self.view)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchButton(_ sender: Any) {
        if textField.text != "" {
            mediBotsearch(description: textField.text!)
          //  Loaf.LoafWheel(Message: "Processing", LoafWidth: 200, LoafHeight: 150, CornerRadius: 20, BGColor1: .blue, BGColor2: .systemOrange, FontStyle: "Avenir-Medium", FontSize: 17, FontColor: .white, Duration: .greatestFiniteMagnitude, WheelStyle: .medium, BlurEffect: nil, LoafWheelView: view)
            textField.text = ""
            
        }else{
            textField.placeholder = "Search Field Empty !"
        }
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        searches.removeAll()
        searches.append(contentsOf: new)
        tableView.reloadData()
    }
    
}

extension MedicineBotViewController{
    func mediBotsearch(description: String){
      let prediction = try! MedBotClassifier.prediction(text: description)

        searches.removeAll()
        searches.append(prediction.label)
        print(prediction.label)
        tableView.reloadData()
        view.endEditing(true)
    }
}

extension MedicineBotViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searches[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Avenir-Medium", size: 18)
        cell.textLabel?.numberOfLines =  3
        cell.isSelected = false
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellNo = Int("\(indexPath.row)")
        print(cellNo!)
        searchStatement(No: cellNo!)
    }
    
    func searchStatement(No: Int){
        switch No {
        case 0:
            mediBotsearch(description: searches[0])
            break
        case 1:
            mediBotsearch(description: searches[1])
            break
        case 2:
            mediBotsearch(description: searches[2])
            break
        case 3:
            mediBotsearch(description: searches[3])
            break
        case 4:
            mediBotsearch(description: searches[4])
            break
        case 5:
            mediBotsearch(description: searches[5])
            break
        default:
            print("wrong cell")
        }
    }
    
}
