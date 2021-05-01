//
//  COVIDDiagnoseVC.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 24/01/21.
//

import UIKit
import CoreML

class COVIDDiagnoseVC: UIViewController {
    
    let covidDetector = COVIDDetector()

    let main = HistoryViewController()
    @IBOutlet weak var imageData: UIImageView!
    @IBOutlet weak var addImageLbl: UILabel!
    
    @IBOutlet weak var diagnoseButton: UIButton!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        diagnoseButton.layer.cornerRadius = 10
        imageData.image = UIImage(named: "Image")
        view1.layer.cornerRadius = 20
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func addImageBtn(_ sender: Any) {
        imageSelectionMode()
    }
    @IBAction func diagnoseBtn(_ sender: Any) {
        
        if imageData.image == UIImage(named: "Image"){
            addImageLbl.textColor = UIColor.red
        }else{
            imageClassifier()
        }
    }
    
}


extension COVIDDiagnoseVC{
    
    func imageClassifier(){
        
        var inputImage = [COVIDDetectorInput]()
        
        if let image = imageData.image{
           let newImage =  buffer(from: imageData.image!)
            let imageForClassification = COVIDDetectorInput(image: newImage!)
            inputImage.append(imageForClassification)
        }
        
        do {
            let prediction = try self.covidDetector.predictions(inputs: inputImage)
            
            for result in prediction{
                let res = result.classLabel
                
                if res == "NORMAL"{
                    self.performSegue(withIdentifier: "positive", sender: nil)
                    main.result.append("Positive")
                    main.imgStatus.append("p")
                    main.testDetail.append("COVID")
                    print(main.testDetail)
                }
                else if res == "COVID"{
                    self.performSegue(withIdentifier: "negative", sender: nil)
                    main.result.append("Negative")
                    main.imgStatus.append("n")
                    main.testDetail.append("COVID")
                }
                else{
                    addImageLbl.isHidden = false
                    addImageLbl.text = "Wrong image"
                }
            }
            
        }catch{
            print("error found\(error)")
        }
    }
}


//MARK:- ALERT CONTROLER METHOD FOR IMAGE SELECTION
extension COVIDDiagnoseVC {
    func imageSelectionMode(){

      let alert = UIAlertController(title: "Select Mode", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: setupImageSelection))
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler:setupImageSelection))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
        
    }
    
}

//MARK:- IMAGE SELECTION METHOD

extension COVIDDiagnoseVC:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.imageData.image = image
       self.addImageLbl.isHidden = true
    }
    
    func setupImageSelection(action: UIAlertAction){
        
        if action.title == "Camera" {
            UIImagePickerController.isSourceTypeAvailable(.camera)
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true)
        }
        else if action.title == "Gallery"{
            UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true)
        }
        else{
            print("None of the above")
        }
        
    }
    
}

extension COVIDDiagnoseVC{
    //MARK:- To convert uiimage to cvpixelbuffer

        func buffer(from image: UIImage) -> CVPixelBuffer? {
          let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
          var pixelBuffer : CVPixelBuffer?
          let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(image.size.width), Int(image.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
          guard (status == kCVReturnSuccess) else {
            return nil
          }

          CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
          let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

          let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
          let context = CGContext(data: pixelData, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

          context?.translateBy(x: 0, y: image.size.height)
          context?.scaleBy(x: 1.0, y: -1.0)

          UIGraphicsPushContext(context!)
          image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
          UIGraphicsPopContext()
          CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

          return pixelBuffer
        }
}
