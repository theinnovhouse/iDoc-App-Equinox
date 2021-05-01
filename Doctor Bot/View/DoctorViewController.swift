//
//  DoctorViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 05/02/21.
//

import UIKit

class DoctorViewController: UIViewController {
    
    var doctorName:[String] = ["Dr. Haider Ali","Dr. George Abraham","Dr. Ekta Sharma","Dr. Jiya Kapoor","Dr. Rohan Patel","Dr. Reshma Gandhi","Dr. David Lezo"]
    var ratings:[String] = ["5.0","4.6","4.9","5.0","4.8","4.5","5.0"]
    var specialist:[String] = ["Cardiologists","Rectal Surgeons","Anesthesiologists","Endocrinologists","Gastroenterologists","Immunologists","Orthopedic"]
    var docImage:[UIImage] = [#imageLiteral(resourceName: "doct7"),#imageLiteral(resourceName: "doct5"),#imageLiteral(resourceName: "doct6"),#imageLiteral(resourceName: "doct4"),#imageLiteral(resourceName: "doc"),#imageLiteral(resourceName: "doct3"),#imageLiteral(resourceName: "doct1")]
    var docTime:[String] = ["10:00 - 19:00","11:00 - 20:00","10:00 - 15:00","09:00 - 16:00","10:00 - 18:00","10:00 - 19:00","08:00 - 15:00"]
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var uti1: UIImageView!
    @IBOutlet weak var uti2: UIImageView!
    @IBOutlet weak var uti3: UIImageView!
    @IBOutlet weak var uti4: UIImageView!
    
    @IBOutlet weak var shadowView1: UIView!
    @IBOutlet weak var shadowView2: UIView!
    @IBOutlet weak var shadowView3: UIView!
    @IBOutlet weak var shadowView4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = 30
        tableView.dataSource = self
        tableView.delegate = self
        
        uti1.layer.cornerRadius = 20
        uti2.layer.cornerRadius = 20
        uti3.layer.cornerRadius = 20
        uti4.layer.cornerRadius = 20
        
        shadowView1.layer.cornerRadius = 20
        shadowView2.layer.cornerRadius = 20
        shadowView3.layer.cornerRadius = 20
        shadowView4.layer.cornerRadius = 20
        
        imageEffect(MyView: shadowView1)
        imageEffect(MyView: shadowView2)
        imageEffect(MyView: shadowView3)
        imageEffect(MyView: shadowView4)
        
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

extension DoctorViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DoctorTableViewCell
        
        cell.docImage.image = docImage[indexPath.row]
        cell.name.text = doctorName[indexPath.row]
        cell.rate.text = ratings[indexPath.row]
        cell.special.text = specialist[indexPath.row]
        cell.time.text = docTime[indexPath.row]
        
        cell.layer.cornerRadius = 30
        //cell.layer.cornerRadius = 8
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds,
        byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

