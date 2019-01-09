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
    @IBOutlet weak var newPasswdLabel2: UITextField!
    @IBOutlet weak var newPasswdLabel: UITextField!
    @IBOutlet weak var prevPasswdLabel: UITextField!
    @IBOutlet weak var nicknameLabel: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        MypageService.shared.getEditUserInfo() {[weak self] (res) in guard let `self` = self else {return}
           
            self.nicknameLabel.text = self.gsno(res.nickname)
            self.emailLabel.text = self.gsno(res.email)
            self.prevPasswdLabel.text = self.gsno(res.password)
            self.profileImg.imageFromUrl(self.gsno(res.profileUrl), defaultImgPath: "")
        }
    }
    
    @IBAction func DismissAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil )
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
    @IBAction func completeEdit(_ sender: Any) {
        UserService.shared.editUsersInfo(nickname: self.nicknameLabel.text!, password: self.prevPasswdLabel.text!, newPassword: self.newPasswdLabel.text!) { [weak self] () in guard let `self` = self else {return}
            
            self.simpleAlert("", "사용자 정보가 변경되었습니다.", completion: nil)
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
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
        
        let size = CGSize(width: 65, height: 65)
        profileImg.image = newImg.crop(to: size)
        
//        let image = UIImage(named: "my_great_photo")?.crop(size)
        UserService.shared.putUserProfilImg(picture: profileImg.image!){
            self.simpleAlert("", "프로필 사진이 변경되었습니다.", completion: nil)
        }
        dismiss(animated: true, completion: nil)
    }
}
