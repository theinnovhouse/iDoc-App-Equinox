//
//  MedistoreViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 06/02/21.
//

import UIKit

class MedistoreViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var pamp: UIImageView!
    @IBOutlet weak var demo: UIImageView!
    @IBOutlet weak var demo1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 30
        
        imageEffect(MyView: view1)
        imageEffect(MyView: view2)
        imageEffect(MyView: view3)
        
        view1.layer.cornerRadius = 20
        view2.layer.cornerRadius = 20
        view3.layer.cornerRadius = 20
        
        image1.layer.cornerRadius = 20
        image2.layer.cornerRadius = 20
        image3.layer.cornerRadius = 20
        
        pamp.layer.cornerRadius = 20
        demo.layer.cornerRadius = 20
        demo1.layer.cornerRadius = 20
        
        demo1.layer.borderWidth = 2
        demo1.layer.borderColor = #colorLiteral(red: 0.3904635906, green: 0.4408243299, blue: 0.8748841882, alpha: 1)
        
        demo.layer.borderWidth = 2
        demo.layer.borderColor = #colorLiteral(red: 0.3904635906, green: 0.4408243299, blue: 0.8748841882, alpha: 1)
        
        
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
