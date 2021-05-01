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
    var docTime:[String] = ["10:00 - 19:00","11:00 - 20:00","10:00 - 15:00","09:00 - 16:00","10:00 - 18:00","10:00 - 19:00","08:00 - 15:00"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
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

extension DoctorViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doctorName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cells", for: indexPath) as! DoctorCollectionViewCell
        cell.doctorName.text = doctorName[indexPath.row]
        cell.stars.text = "⭐️ \(ratings[indexPath.row])"
        cell.speciality.text = specialist[indexPath.row]
        cell.time.text = docTime[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width-40)/2
        let height = width*(200/140)
        let cellSize = CGSize(width: width, height: height)
        return cellSize
    }
    
    
}
