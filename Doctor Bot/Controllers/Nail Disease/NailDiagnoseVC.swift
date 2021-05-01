//
//  NailDiagnoseVC.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 24/01/21.
//

import UIKit

class NailDiagnoseVC: UIViewController {

    let nailDiseaseDetector = NailDisease()
    
    @IBOutlet weak var nailImageData: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var diagnose: UIButton!
    @IBOutlet weak var addImgLabel: UILabel!
    @IBOutlet weak var diseaseDescription: UILabel!
    @IBOutlet weak var diseaseName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 20
        
        diagnose.layer.cornerRadius = 10
        nailImageData.image = UIImage(named: "naildiag")
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func addImage(_ sender: Any) {
        diseaseName.text = "Result"
        diseaseDescription.text = "-"
        imageSelectionMode()
    }
    @IBAction func diagnoseBtn(_ sender: Any) {
        
        if nailImageData.image == UIImage(named: "naildiag"){
            addImgLabel.textColor = UIColor.red
        }else{
            imageClassifier()
        }
    }
    
}

//MARK:- MLModel Methods

extension NailDiagnoseVC{
    
    func imageClassifier(){
        
        var inputImage = [NailDiseaseInput]()
        
        if let image = nailImageData.image{
           let newImage =  buffer(from: nailImageData.image!)
            let imageForClassification = NailDiseaseInput(image: newImage!)
            inputImage.append(imageForClassification)
        }
        
        do {
            let prediction = try self.nailDiseaseDetector.predictions(inputs: inputImage)
            
            for result in prediction{
                let res = result.classLabel
                
                if res == "Darier's disease"{
                    diseaseName.text = "Darier's disease"
                    diseaseDescription.text = "Darier disease is a skin condition characterized by wart-like blemishes on the body. "
                }
                else if res == "Lindsay's nails"{
                    diseaseName.text = "Lindsay's nails"
                    diseaseDescription.text = "Half and half nails or Lindsay's nails is a systemic onychopathy, clinically characterized by a white coloring of the proximal half nail and a red-brown coloration of the distal half of all the nails."
                    diseaseDescription.font = diseaseDescription.font.withSize(14)
                }
                else if res == "Muehrck-e's lines"{
                    diseaseName.text = "Muehrck-e's lines"
                    diseaseDescription.text = "Muehrcke's nails are a disorder of the nail bed which can be a reflection of systemic disease"
                }
                else if res == "aloperia areata"{
                    diseaseName.text = "Aloperia areata"
                    diseaseDescription.text = "Alopecia areata (AA) is a chronic, autoimmune disease, with signs of nail dystrophy in AA patients "
                }
                else if res == "beau's lines"{
                    diseaseName.text = "Beau's lines"
                    diseaseDescription.text = "Beau's lines are horizontal depressions in the nail plate that run parallel to the shape of the white, moon-shaped portion of the nail bed seen at the nail's origin."
                }
                else if res == "bluish nail"{
                    diseaseName.text = "Bluish nail"
                    diseaseDescription.text = "Blue fingernails are caused by a low level or lack of oxygen circulating in your red blood cells. This condition is known as cyanosis. "
                }
                else if res == "clubbing"{
                    diseaseName.text = "Clubbing"
                    diseaseDescription.text = "Nail clubbing is a change in the structure of fingernails or toenails in which the finger and nail"
                }
                else if res == "eczema"{
                    diseaseName.text = "Eczema"
                    diseaseDescription.text = "The nail plate is the hard surface that forms the top of your nails. It's made of keratin cells."
                }
                else if res == "koilonychia"{
                    diseaseName.text = "Koilonychia"
                    diseaseDescription.text = "The most common cause of koilonychia is chronic iron deficiency anemia. Iron deficiency can result from several causes including malnutrition, gastrointestinal bleeding, genitourinary bleeding."
                    diseaseDescription.font = diseaseDescription.font.withSize(14)
                }
                else if res == "leukonychia"{
                    diseaseName.text = "Leukonychia"
                    diseaseDescription.text = "The most common cause of leukonychia is injury to the nail bed. These injuries can occur if you pinch or strike your nail or finger. "
                }
                else{
                    diseaseName.text = "No Disease Found!"
                    diseaseDescription.text = "Your nails are safe and awesome!"
                }
            }
            
        }catch{
            print("error found\(error)")
        }
    }
}




//MARK:- IMAGE SELECTION METHOD

extension NailDiagnoseVC:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.nailImageData.image = image
       self.addImgLabel.isHidden = true
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
extension NailDiagnoseVC {
    func imageSelectionMode(){

      let alert = UIAlertController(title: "Select Mode", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: setupImageSelection))
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler:setupImageSelection))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
        
    }
    
}


//MARK:- To convert uiimage to cvpixelbuffer

extension NailDiagnoseVC{
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
