//
//  SmatchingListVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class SmatchingListVC: UIViewController, CheckBoxDelegate, NoticeCellDelegate {
    
    @IBOutlet weak var STACKVIEWCONST: NSLayoutConstraint!
    
    var flag = 0
    
    var cond_idx : Int?
    
    //contentview 영역 outlet
    @IBOutlet weak var settingAlarmBtn: Checkbox!
    
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var advantageLabel: UILabel!
    @IBOutlet weak var excCateLabel: UILabel!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var busiTypeLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var conditionTitle: UILabel!
    
    
    @IBOutlet weak var upBtn: UIButton!
    @IBOutlet weak var downBtn: UIButton!
    @IBOutlet weak var hideViewBtn: UIImageView!
    @IBOutlet weak var showViewBtn: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var noticeTableView: UITableView!
    @IBOutlet weak var noticesCount: UILabel!
    
    var noticeList = [Notice]()
    
    var conditionList = [Condition]()
    
    let checkbox = Checkbox()
    
    var picker : UIPickerView!
    var toolbar : UIToolbar!
    
    let alignment_standard : [String] = ["최근등록순", "마감임박순", "조회순"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        noticeTableView.dataSource = self
        self.settingAlarmBtn.delegate = self

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ConditionSettingSerive.shared.getFitConditionInfo(cond_idx: self.gino(self.cond_idx)) {[weak self] (data) in guard let `self` = self else {return}
            print(data)
            self.conditionTitle.text = self.gsno(data.condName)
            if self.gbno(data.alert) == true {
                self.checkBoxDidChange(checkbox: self.settingAlarmBtn)
            }
        }
        
        NoticeService.shared.getAllNotice(request_num: 20, exist_num: self.noticeList.count) {[weak self] (data) in guard let `self` = self else {return}
            
            self.noticeList += data
            self.noticeTableView.reloadData()
            
        }

    }
    
    func checkBoxDidChange(checkbox: Checkbox) {
        if checkbox == self.settingAlarmBtn {
            self.settingAlarmBtn.isChecked = !checkbox.isChecked
        }
//         else {
//            self.siCheckBox.isChecked = !checkbox.isChecked
//        }
    }
    
    @IBAction func showConditionView(_ sender: Any) {
        if flag == 0 {
            showView()
            flag = 1
        }
        else {
            hideView()
            flag = 0
        }
    }
    func showView() {
        upBtn.isHidden = false
        downBtn.isHidden = true
        
        showViewBtn.isHidden = true
        hideViewBtn.isHidden = false
        self.contentView.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 1.0, animations: ({
            self.STACKVIEWCONST.constant = 317
        }))
    }
    
    func hideView() {
        upBtn.isHidden = true
        downBtn.isHidden = false
        showViewBtn.isHidden = false
        hideViewBtn.isHidden = true
        UIView.animate(withDuration: 1.0, animations: ({
            self.contentView.alpha  = 1;
        }))
        self.contentView.transform = CGAffineTransform(scaleX: 0, y: -self.contentView.frame.height)
        UIView.animate(withDuration: 1.0, animations: ({
            self.STACKVIEWCONST.constant = 43
        }))
        
    }
    
    func initView() {
        
        upBtn.isHidden = false
        downBtn.isHidden = true
        showViewBtn.isHidden = true
        hideViewBtn.isHidden = false
        self.contentView.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 1.0, animations: ({
            self.STACKVIEWCONST.constant = 317
        }))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeAlignment(_ sender: ChangeButton) {
        
        setupPiker()
        setupToolbar()
        
        sender.inputAccessoryView = toolbar
        
        sender.inputView = picker
        
    }
    
    //piker초기화
    func setupPiker() {
        picker = UIPickerView()
        //delegate를 위임받는 주체를 명시해줘야한다. (viewcontroller 자체가 위임받는다.)
        //밑에 구현한 것들을 정상적으로 수행할 수 있도록 한다.
        picker.delegate = self
        picker.dataSource = self
        
    }
    func setupToolbar() {
        toolbar = UIToolbar(frame : CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        let done = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(selectPart))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolbar.sizeToFit()
        toolbar.isUserInteractionEnabled = true
        toolbar.setItems([space,done], animated: true)
        
    }
    //selector안에 들어감
    @objc func selectPart() {
        let row = picker.selectedRow(inComponent: 0)
        let pick_alignment = alignment_standard[row]
        
        
        switch pick_alignment {
        case "최근등록순":
            alignmentLabel.text = pick_alignment
        case "마감임박순":
            alignmentLabel.text = pick_alignment
        case "조회순":
            alignmentLabel.text = pick_alignment
        default:
            break
        }
        //        done 버튼을 누르고 함수 실행 중 edit을 끝냄
        self.alignmentLabel.endEditing(true)
    }
    
    //스크랩 버튼 클릭시 동작
    func doScrapNotice(noticeIdx: Int) {
        print(noticeIdx)
        NoticeService.shared.putNoticeScrap(noticeIdx: noticeIdx) {
            [weak self] (data) in guard let `self` = self else {return}
            print(data.scrap)

        }
        self.noticeTableView.reloadData()
    }
}
extension SmatchingListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
extension SmatchingListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return noticeList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as! NoticeCell
        let notice = noticeList[indexPath.row]
        
        cell.delegate = self
        
        cell.noticeIdx = gino(notice.noticeIdx)
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
        
        NoticeService.shared.getNoticeScrap(notice_idx: notice.noticeIdx!) {[weak self] (data) in guard let `self` = self else {return}
            
            print(data.scrap)
            if self.gino(data.scrap) == 0 {
                cell.scrapActiveBtn.isHidden = true
                cell.scrapDeactiveBtn.isHidden = false
            } else {
                cell.scrapActiveBtn.isHidden = false
                cell.scrapDeactiveBtn.isHidden = true
            }
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

