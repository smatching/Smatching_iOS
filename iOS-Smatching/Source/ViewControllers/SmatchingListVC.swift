//
//  SmatchingListVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class SmatchingListVC: UIViewController {
    enum CellState {
        case collapsed
        case expanded
        
    }
    
    @IBOutlet weak var upBtn: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var downBtn: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var noticeCntLabel: UILabel!
    @IBOutlet weak var noticeTableView: UITableView!
    
    private let expandedViewIndex: Int = 1
    
    var state: CellState = .collapsed {
        didSet {
            toggle()
        }
    }
    
    var noticeList = [Notice]()
    
    var picker : UIPickerView!
    var toolbar : UIToolbar!
    
    let alignment_standard : [String] = ["최근등록순", "마감임박순", "조회순"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noticeTableView.dataSource = self
        contentView.layer.cornerRadius = 5.0
        upBtn.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NoticeService.shared.getAllNotice(request_num: 20, exist_num: self.noticeList.count) {[weak self] (data) in guard let `self` = self else {return}
            
            self.noticeList += data
            print(data.count)
            print(self.noticeList.count)
//            self.noticeCntLabel.text = "총 " + "\(self.noticeList.count)" + "건"
            self.noticeTableView.reloadData()
        }
    }
    
    private func toggle() {
        stackView.arrangedSubviews[expandedViewIndex].isHidden = stateIsCollapsed()
    }
    
    private func stateIsCollapsed() -> Bool {
        return state == .collapsed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeAlignment(_ sender: ChangeButton) {
        print("조회 조건 picker 띄움!")
        picker = UIPickerView()
        
        picker.delegate = self
        
        picker.dataSource = self
        
        toolbar = UIToolbar()
        
        toolbar.sizeToFit()
        
        toolbar.barTintColor = UIColor.blue
        
        toolbar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(selectPart))
        
        toolbar.setItems([doneButton], animated: false)
        
        toolbar.isUserInteractionEnabled = true
        
        sender.inputAccessoryView = toolbar
        
        sender.inputView = picker

    }
    @objc func doneTapped() {
        
        print("done tapped")
        
    }

    //piker초기화
    func setupPiker() {
        picker = UIPickerView()
        //delegate를 위임받는 주체를 명시해줘야한다. (viewcontroller 자체가 위임받는다.)
        //밑에 구현한 것들을 정상적으로 수행할 수 있도록 한다.
        picker.delegate = self
        picker.dataSource = self
        //textfield 선택 -> 키보드가 아닌 piker로
//        textField.inputView = picker
        
       
    }
    func setupToolbar() {
        toolbar = UIToolbar(frame : CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        let done = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(selectPart))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolbar.setItems([space,done], animated: true)
//        textField.inputAccessoryView = toolbar
    }
    //selector안에 들어감
    @objc func selectPart() {
        let row = picker.selectedRow(inComponent: 0)
        let pick_alignment = alignment_standard[row]
        
        
//        switch pick_alignment {
//        case "최근등록순":
////            partImage.image = UIImage(named: "sopt_doplan")
//        case "마감임박순":
////            partImage.image = UIImage(named: "sopt_dodesign")
//        case순"조회순":
////            partImage.image = UIImage(named: "sopt_dodevelop")
//        default:
//            break
//        }
        //done 버튼을 누르고 함수 실행 중 edit을 끝냄
//        textField.endEditing(true)
        
    }
}
extension SmatchingListVC : UITableViewDelegate {
    
}
extension SmatchingListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as! NoticeCell
        let notice = noticeList[indexPath.row]
        
        cell.titleLabel.text = gsno(notice.title)
        cell.institutionLabel.text = gsno(notice.institution)
        if gino(notice.dday) > 1000 {
            cell.ddayLabel.text = "예산소진시"
        }
        else {
            cell.ddayLabel.text = "D - " + "\(gino(notice.dday))"
        }
        if gino(notice.scrap) == 0 {
            cell.scrapActiveBtn.isHidden = true
            cell.scrapDeactiveBtn.isHidden = false
        }
        else {
            cell.scrapActiveBtn.isHidden = false
            cell.scrapDeactiveBtn.isHidden = true
        }
        
        return cell
    }

}
//delegate를 채택할 때 delegate관련 메소드만 따로 정의
//동작에 관련한 메소드만 정의함 (pickerview 자체의 뷰에 대한 것-> title 속성)
extension SmatchingListVC : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return alignment_standard[row]//row index에 해당하는 data 를 반환
    }
}

//protocol -> optional method x (구현 해 줘야함)
//view 에 들어갈 데이터를 어떻게 설정해줄지에 대한 method선언
extension SmatchingListVC : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //pickerview data를 몇개 쓸 것인가
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //row가 몇 개인가
        return alignment_standard.count
    }
    
    
}
