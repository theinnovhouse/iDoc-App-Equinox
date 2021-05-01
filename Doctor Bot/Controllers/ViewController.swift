//
//  ViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 23/01/21.
//

import UIKit
import Loafjet
import FirebaseDatabase

class ViewController: UIViewController {
    
    @IBOutlet weak var diagnoseBtton: UIButton!
    @IBOutlet weak var pillBtn: UIButton!
    @IBOutlet weak var doctorBtn: UIButton!
    @IBOutlet weak var hospitalizeBtn: UIButton!
    @IBOutlet weak var emergencyBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var wishLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    let defaults = UserDefaults.standard
    let customColor:UIColor = #colorLiteral(red: 1, green: 0.4874575138, blue: 0, alpha: 1)
    static var name:Any = ""
    static var city:Any = ""
    static var phone:Any = ""
    static var email:Any = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diagnoseBtton.layer.cornerRadius = 10
        diagnoseBtton.layer.borderWidth = 0
        diagnoseBtton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        pillBtn.layer.cornerRadius = 10
        doctorBtn.layer.cornerRadius = 10
        hospitalizeBtn.layer.cornerRadius = 10
        
        emergencyBtn.layer.cornerRadius = 10
        //defaults.removeObject(forKey: "userId")
        profileImage.layer.cornerRadius = 5
        
        fetchUserData()
    }
        @IBAction func logOut(_ sender: Any) {
            let alert = UIAlertController(title: "LogOut", message: "Are you sure?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "LogOut", style: .destructive, handler: { _ in
                DispatchQueue.main.async {
                    self.defaults.removeObject(forKey: "userId")
                    self.dismiss(animated: true, completion: nil)
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    @IBAction func diagnoseButton(_ sender: Any) {
        self.performSegue(withIdentifier: "diagnose", sender: nil)
    }
    @IBAction func medicineBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "medicine", sender: nil)
    }
    
    //    @IBAction func historyBtn(_ sender: Any) {
    //        self.performSegue(withIdentifier: "report", sender: nil)
    //    }
    @IBAction func reportButton(_ sender: Any) {
        self.performSegue(withIdentifier: "reportss", sender: nil)
    }
    @IBAction func doctor(_ sender: Any) {
        self.performSegue(withIdentifier: "doctor", sender: nil)
    }
    
    @IBAction func mediStore(_ sender: Any) {
        self.performSegue(withIdentifier: "medistore", sender: nil)
    }
    
    func fetchUserData() {
        let id = defaults.object(forKey: "userId") as! String
        let ref = Database.database().reference().child("Users/\(id)")
        
        ref.observeSingleEvent(of: .value, with: { (snap : DataSnapshot)  in
            DispatchQueue.main.async {
                
                let city =  snap.childSnapshot(forPath: "city").value
                let name = snap.childSnapshot(forPath: "name").value
                let phone = snap.childSnapshot(forPath: "phone").value
                let email = snap.childSnapshot(forPath: "email").value
                
                ViewController.city = city!
                ViewController.name = name!
                ViewController.email = email!
                ViewController.phone = phone!
                
                print(ViewController.city)
                
                self.locationLabel.text = "\(ViewController.city), India"
                self.wishLabel.text = "Good Morning, \(ViewController.name)"
                
                Loaf.GradientLoaf(Message: "Welcome \(ViewController.name)", Position: .bottom, LoafWidth: 280, LoafHeight: 44, CornerRadius: 20, FontStyle: "Avenir-Medium", FontSize: 17, BGColor1: .link.withAlphaComponent(0.5), BGColor2: self.customColor.withAlphaComponent(1), FontColor: .black, LoafImage: nil, AnimationDirection: .Bottom, Duration: 2, LoafjetView: self.view)
            }
            
            
        }) { (err: Error) in
            print("\(err.localizedDescription)")
            
        }
    }
}

