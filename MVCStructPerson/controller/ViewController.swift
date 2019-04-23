//
//  ViewController.swift
//  MVCStructPerson
//
//  Created by Boss on 4/24/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var sexTextField: UITextField!
    
    var perSon: Person?
    var indexPath: IndexPath?
    
    var imagePicker = UIImagePickerController()
    var imagee: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if perSon != nil{
            images.image = perSon?.image
            nameTextField.text = perSon?.name
            phoneTextField.text = perSon?.phone
            sexTextField.text = perSon?.sex
            
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func ChonAnh(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Thông Báo", message: "Chọn Ảnh", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "📗 Photo Library", style: .default, handler: {(action: UIAlertAction) in self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("asdasdas")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let tempImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imagee = tempImage.pngData()
            images.image = tempImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func Save(_ sender: Any) {
        if perSon != nil{
            DataService.conpho.edit(indexPath: indexPath!, image1: images.image!, name1: nameTextField.text!, phone1: phoneTextField.text!, sex1: sexTextField.text!)
        }else{
            
            DataService.conpho.add(image1: images.image!, name1: nameTextField.text!, phone1: phoneTextField.text!, sex1: sexTextField.text!)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
}

