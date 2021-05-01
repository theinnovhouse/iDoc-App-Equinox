//
//  LogInViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 01/05/21.
//

import UIKit
import Loafjet
import FirebaseAuth

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTf.layer.cornerRadius = 20
        passwordTf.layer.cornerRadius = 20
        checkUserSigned()
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        login()
    }
    
}

extension LogInViewController {
    func login() {
        //let userID = Auth.auth().currentUser!.uid
        if emailTf.text != "" && passwordTf.text != "" {
            FirebaseAuth.Auth.auth().signIn(withEmail: emailTf.text!, password: passwordTf.text!) { result, error in
                if error != nil {
                    self.alert(mesg: error!.localizedDescription)
                    //print(error?.localizedDescription)
                }
                else{
                    let id = Auth.auth().currentUser!.uid 
                    UserDefaults.standard.setValue(id, forKey: "userId")
                    //DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "loginToMain", sender: nil)
                    // }
                }
            }
        }else{
            alert(mesg: "Fields are incomplete!")
        }
    }
    
    func alert(mesg: String) {
        let alert = UIAlertController(title: "Error", message: mesg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

//MARK:- Check signin or not

extension LogInViewController {
    func checkUserSigned() {
        guard let id = UserDefaults.standard.object(forKey: "userId") as? String else {
            Loaf.PlainLoaf(Message: "Welcome to iDoc", Position: .top, LoafWidth: 250, LoafHeight: 44, CornerRadius: 20, FontStyle: "Avenir-Medium", FontSize: 17, BGColor: .link.withAlphaComponent(0.4), FontColor: .black, LoafImage: nil, AnimationDirection: .Top, Duration: 2, LoafjetView: self.view)
            return
        }
        if id != "" {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "loginToMain", sender: nil)
            }
        }
    }
}
