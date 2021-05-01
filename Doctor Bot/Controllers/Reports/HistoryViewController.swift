//
//  ReportViewController.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 24/01/21.
//

import UIKit
import Loafjet

class HistoryViewController: UIViewController {

    var testDetail:[String] = ["COVID Checkup","Nail Checkup", "Skin Checkup","COVID Checkup","COVID Checkup","Nail Checkup","Skin Checkup"]
    var result:[String] = ["Positive","Darier's disease","Benign Detected","Negative","Negative","Muehrck-e's lines","Malignant"]
    var imgStatus:[String] = ["p","p","p","n","n","p","p"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 20
        tableView.layer.cornerRadius = 20
        
        Loaf.GradientLoaf(Message: "Diagnostic History", Position: .bottom, LoafWidth: 250, LoafHeight: 45, CornerRadius: 20, FontStyle: "Avenir-Medium", FontSize: 16, BGColor1: .orange, BGColor2: .black, FontColor: .white, LoafImage: nil, AnimationDirection: .Bottom, Duration: 5, LoafjetView: view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testDetail.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        cell.test.text = testDetail[indexPath.row]
        cell.result.text = result[indexPath.row]
        cell.img.image = UIImage(named: imgStatus[indexPath.row])
        cell.isUserInteractionEnabled = false
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


}
