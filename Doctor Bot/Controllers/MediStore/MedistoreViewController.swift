//
//  MedistoreViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 06/02/21.
//

import UIKit

class MedistoreViewController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func imageEffect(MyView: UIView){
        
        MyView.layer.shadowOffset = CGSize(width: 5, height: 5)
        MyView.layer.shadowColor = UIColor.black.cgColor
        MyView.layer.shadowRadius = 3
        MyView.layer.shadowOpacity = 0.80
    }
    
}
