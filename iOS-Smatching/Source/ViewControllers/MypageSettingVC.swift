//
//  MypageSettingVC.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 2019. 1. 3..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class MypageSettingVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    
    @IBAction func DismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil )
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func updateProfileImgBtn(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                picker.sourceType = .camera
                picker.allowsEditing = true
                picker.showsCameraControls = true
                self.present(picker, animated: true)
                
            } else {
                print("not available")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action) in
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(picker, animated: true)
    }
}
extension MypageSettingVC :  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImg = UIImage()
        
        if let possImg = info[.editedImage] as? UIImage {
            newImg = possImg
        }
        else if let possImg = info[.originalImage] as? UIImage {
            newImg = possImg
        }
        else {
            return
        }
        profileImg.image = newImg
        dismiss(animated: true, completion: nil)
    }
}
