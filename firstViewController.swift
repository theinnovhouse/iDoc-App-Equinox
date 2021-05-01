//
//  firstViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 01/05/21.
//

import UIKit

class firstViewController: UIViewController {

    override func loadView() {
        super.loadView()
        checkUserSigned()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK:- Check signin or not

extension firstViewController {
    func checkUserSigned() {
        guard let id = UserDefaults.standard.object(forKey: "userId") as? String else {
            return
        }
        if id != "" {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "alreadyPresent", sender: nil)
            }
            
            print("id:\(id)")
        }
        else{
            print(id)
        }
    }
}
