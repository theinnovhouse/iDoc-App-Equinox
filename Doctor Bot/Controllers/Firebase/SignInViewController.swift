//
//  SiginViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 01/05/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var cityTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    
    let defaults = UserDefaults.standard
    
    var ref: DatabaseReference!
    
    static var userID = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.object(forKey: "userId")
        // Do any additional setup after loading the view.
    }
    @IBAction func signUpTapped(_ sender: Any) {
        checkField()
    }
    
    @IBAction func testBtn(_ sender: Any) {
        defaults.removeObject(forKey: "userId")
    }
    
}


extension SignInViewController {
    func checkField() {
        if (nameTextField.text != "" && phoneTf.text != "" && emailTf.text != "" && cityTf.text != "" && passwordTf.text != "" && confirmPass.text != "") {
            if (passwordTf.text == confirmPass.text) {
                signInTapped()
            }else{
                alert(mesg: "Password and ConfirmPassword are not same")
            }
            
        }else{
            alert(mesg: "Fields are empty")
        }
    }
    
    func signInTapped() {
        FirebaseAuth.Auth.auth().createUser(withEmail: emailTf.text!, password: passwordTf.text!) { result, error in
            if error != nil {
                self.alert(mesg: error!.localizedDescription)
            }else{
                print("created")
                SignInViewController.userID = Auth.auth().currentUser!.uid
                print(Auth.auth().currentUser!.uid)
                self.defaults.setValue(SignInViewController.userID, forKey: "userId")
                self.addDetails()
            }
        }
    }
    
    func addDetails() {
        ref = Database.database().reference()
        let post = ["city": cityTf.text!, "email": emailTf.text!, "name":nameTextField.text!, "phone":phoneTf.text!]
        ref.child("Users").child(SignInViewController.userID).setValue(post)
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "sigupToMain", sender: nil)
        }
    }
    
    func alert(mesg: String) {
        let alert = UIAlertController(title: "Error", message: mesg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


