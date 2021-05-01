//
//  LogInViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 01/05/21.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        }
    }
    
    func alert(mesg: String) {
        let alert = UIAlertController(title: "Error", message: mesg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
