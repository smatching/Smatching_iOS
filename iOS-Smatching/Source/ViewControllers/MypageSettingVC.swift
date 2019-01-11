//
//  MypageSettingVC.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 2019. 1. 3..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class MypageSettingVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var newPasswdLabel2: UITextField!
    @IBOutlet weak var newPasswdLabel: UITextField!
    @IBOutlet weak var prevPasswdLabel: UITextField!
    @IBOutlet weak var nicknameLabel: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var stackViewConst: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initGestureRecognizer()
        
        MypageService.shared.getEditUserInfo() {[weak self] (res) in guard let `self` = self else {return}
           
            self.nicknameLabel.text = self.gsno(res.nickname)
            self.emailLabel.text = self.gsno(res.email)
            self.prevPasswdLabel.text = self.gsno(res.password)
            self.profileImg.imageFromUrl(self.gsno(res.profileUrl), defaultImgPath: "")
            self.profileImg.layer.cornerRadius = self.profileImg.frame.height / 2
            self.profileImg.layer.masksToBounds = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterForKeyboardNotifications()
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
    
    // TextField borderColor 변경
    // Text 입력 중엔 민트색, Text없을시 lightgray
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        BlueTextField(textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty == true {
            LightGrayTextField(textField)
        } else {
            BlueTextField(textField)
            
        }
    }
    
    //우측 지우기 버튼
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.applyCustomClearbutton()
        return true
    }
    
    // TextField Tap할 때 placeholder 지우기/ borderColor 지정
    func textFieldAddTarget (_ textField: UITextField) {
        textField.addTarget(self, action: #selector(whenTxtFieldTapped(_:)), for: UIControl.Event.touchDown)
    }
    @objc func whenTxtFieldTapped (_ textField: UITextField) {
        BlueTextField(textField)
        textField.placeholder = ""
    }
    // TextField 색깔 지정 함수
    func BlueTextField (_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 64/255, green: 178/255, blue: 204/255, alpha: 1).cgColor
    }
    func LightGrayTextField (_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func completeEdit(_ sender: Any) {
        UserService.shared.editUsersInfo(nickname: self.nicknameLabel.text!, password: self.prevPasswdLabel.text!, newPassword: self.newPasswdLabel.text!) { [weak self] () in guard let `self` = self else {return}
            
            self.simpleAlert("", "사용자 정보가 변경되었습니다.", completion: nil)
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func goBackToMypage(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        profileImg.layer.masksToBounds = true
        
        let size = CGSize(width: 65, height: 65)
        profileImg.image = newImg.crop(to: size)
        
//        let image = UIImage(named: "my_great_photo")?.crop(size)
        UserService.shared.putUserProfilImg(picture: profileImg.image!){
            self.simpleAlert("", "프로필 사진이 변경되었습니다.", completion: nil)
        }
        dismiss(animated: true, completion: nil)
    }
}
extension MypageSettingVC : UIGestureRecognizerDelegate {
    func initGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTabMainView(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    @objc func handleTabMainView(_ sender: UITapGestureRecognizer){
        //입력할 수 있는 기능을 없앰
        self.emailLabel.resignFirstResponder()
        self.nicknameLabel.resignFirstResponder()
        self.prevPasswdLabel.resignFirstResponder()
        self.newPasswdLabel.resignFirstResponder()
        self.newPasswdLabel2.resignFirstResponder()
    }
    
    //탭 제스쳐가 먹히는 상황과 아닌 상황을 판단
    //UIGestureRecognizerDelegate에 있는 함수
    //키보드가 있는 공간에 입력 필드가 있는 경우 사용
    
    //stackview안에있는 텍스트 필드가 위로 올라감.
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.stackViewConst.constant = -100
        })
        
        self.view.layoutIfNeeded()
        
    }
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.stackViewConst.constant = 43
        })
        
        self.view.layoutIfNeeded()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: newPasswdLabel))! || (touch.view?.isDescendant(of: newPasswdLabel2))! ||
            (touch.view?.isDescendant(of: prevPasswdLabel))! ||
            (touch.view?.isDescendant(of: nicknameLabel))! ||
            (touch.view?.isDescendant(of: emailLabel))! {
            return false
        }
        return true
    }
    
    
    func registerForKeyboardNotifications() {
        //addObserver - 특정 동작에 selector추가 -> 계속 지켜보고 있으면서 특정 상황이 오면 실행된다.
        //addObserver - 다른 view controller로 가기 전에 이걸 없애줘야 한다. removeObserver
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
