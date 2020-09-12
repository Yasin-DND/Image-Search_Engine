//
//  ViewController.swift
//  Image-Search-Engine
//
//  Created by Mac on 12/09/2563 BE.
//  Copyright © 2563 DND. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    var selectedImage = UIImage()
    let imagePickerController = UIImagePickerController()
    
    override func viewWillAppear(_ animated: Bool) {
        selectedImage = UIImage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func alertAction(_ title : String,_ message : String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ImageDetails"{
            let nav =  segue.destination as! UINavigationController
            let vc = nav.topViewController as! DetailViewController
            vc.productImage = self.selectedImage
        }
    }
    
}
extension RootViewController{
    @IBAction func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePickerController.sourceType = .camera
        }else{
            alertAction("Camera Failure", "There Is Issue While Opening Camera Please Restart Your Device")
        }
    }
    @IBAction func openGallery(){
        self.imagePickerController.sourceType = .photoLibrary
        self.imagePickerController.delegate = self
        self.imagePickerController.isEditing = true
        self.present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectedImage = editedImage
            print("Edited Image")
        }else{
            if let orignalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                selectedImage = orignalImage
                print("Selected Image")
            }
        }
        dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "ImageDetails", sender: nil)
    }
}
