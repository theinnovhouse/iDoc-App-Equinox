//
//  SkinCancerVC.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 24/01/21.
//

import UIKit

class SkinCancerVC: UIViewController {
    
    let cancerDetector = skinCancer()

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var skinImage: UIImageView!
    @IBOutlet weak var diagnose: UIButton!
    @IBOutlet weak var addImageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 20
        diagnose.layer.cornerRadius = 10
        skinImage.image = UIImage(named: "skindiag")
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func diagnoseBtn(_ sender: Any) {
        
        if skinImage.image == UIImage(named: "skindiag"){
            addImageLabel.textColor = UIColor.red
        }else{
            imageClassifier()
        }
    }
    @IBAction func addImageBtn(_ sender: Any) {
        imageSelectionMode()
    }
    @IBAction func uploadButton(_ sender: Any) {
        imageSelectionMode()
    }
    
}

//MARK:- MLModel Methods

extension SkinCancerVC{
    
    func imageClassifier(){
        
        var inputImage = [skinCancerInput]()
        
        if let image = skinImage.image{
           let newImage =  buffer(from: skinImage.image!)
            let imageForClassification = skinCancerInput(image: newImage!)
            inputImage.append(imageForClassification)
        }
        
        do {
            let prediction = try self.cancerDetector.predictions(inputs: inputImage)
            
            for result in prediction{
                let res = result.classLabel
                
                if res == "benign"{
                    print("what")
                    self.performSegue(withIdentifier: "benign", sender: nil)
                }
                else if res == "malignant"{
                    print("whatssdsd")
                    self.performSegue(withIdentifier: "malignant", sender: nil)
                }
                else{
                   // imagelabel.isHidden = false
                  //  imagelabel.text = "Wrong image"
                }
            }
            
        }catch{
            print("error found\(error)")
        }
    }
}




//MARK:- IMAGE SELECTION METHOD

extension SkinCancerVC:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.skinImage.image = image
       //self.imagelabel.isHidden = true
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


//MARK:- ALERT CONTROLER METHOD FOR IMAGE SELECTION
extension SkinCancerVC {
    func imageSelectionMode(){

      let alert = UIAlertController(title: "Select Mode", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: setupImageSelection))
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler:setupImageSelection))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
        
    }
    
}


//MARK:- To convert uiimage to cvpixelbuffer

extension SkinCancerVC{
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
