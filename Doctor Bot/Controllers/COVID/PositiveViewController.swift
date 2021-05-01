//
//  PositiveViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 24/01/21.
//

import UIKit

class PositiveViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 20
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
