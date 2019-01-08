//
//  SmatchingListVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class SmatchingListVC: UIViewController, CheckBoxDelegate, NoticeCellDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var noConditionView: UIView!
    
    @IBOutlet var showStatusArrowImg: UIImageView!
    var flag = true
    
    var cond_idx : Int?
    
    var cur_cond_idx : Int?
    var conditionList = [Condition]()
    @IBOutlet weak var pageControl: UIPageControl!
    
    var fitConditionRes : FitConditionResponse?
    
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
    
    @IBOutlet weak var showListBtn: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var noticeTableView: UITableView!
    @IBOutlet weak var noticesCount: UILabel!
    
    var noticeList = [Notice]()
    
    var picker : UIPickerView!
    var toolbar : UIToolbar!
    
    let alignment_standard : [String] = ["최근등록순", "마감임박순", "조회순"]
    
    let location: [String] = ["서울", "부산", "대구", "인천", "광주", "대전", "울산", "세종", "강원", "경기", "경남", "경북", "전남", "전북", "충남", "충북", "제주"]
    let age: [String] = ["만 20세 미만", "만 20세 이상 ~ 39세 이하", "40세 이상"]
    let period: [String] = ["0~1년", "1~2년", "2~3년", "3~4년", "4~5년", "5~6년", "6~7년", "7년 이상", "예비창업자"]
    let businessType: [String] = ["중소기업", "중견기업", "대기업", "1인창조기업", "소상공인", "전통시장", "예비창업자"]
    let field: [String] = ["농업,임업 및 어업", "광업", "전기, 가스, 증기 및 공기 조절 공금업", "수도, 하수 및 폐기물 처리, 원료 재생업", "건설업", "도매 및 소매업", "운수 및 창고업", "숙박 및 음식접업", "정보통신업", "금융 및 보험업", "부동산업", "전문, 과학 및 기술 서비스업", "사업시설 관리, 사업지원 및 임대서비스업", "공공 행정, 국방 및 사회보장 행정", "교육 서비스업", "보건업 및 사회복지 서비스업", "예술, 스포츠 및 여가관련 서비스업", "협회 및 단체, 수리 및 기타 개인 서비스업", "가구 내 고용활동 및 달리 분류되지 않은 자가 소비 생산활동", "국제 및 외국기관", "4차산업분야"]
    let excCate: [String] = ["창업교육, 창업 멘토링", "지식재산권(특허, 저작권 등)", "시설, 공간", "국내판로 확대", "해외판로 확대", "시제품 제작,제조양산", "정부 대출 지원", "무대출 자금 지원"]
    let advantage: [String] = ["재도전기업", "여성기업", "장애인기업", "사회적기업", "1인창조기업", "4차산업관련기업", "대학(원)생", "공동창업"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.shouldRemoveShadow(true); self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        initView()
        //조건이 없을 경우 나오는 뷰
        self.noConditionView.isHidden = false
        
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
        
        self.settingAlarmBtn.delegate = self
        
        //조건 뷰 선택하면 접혀지도록 설정하기
        let tap = UITapGestureRecognizer(target: self, action: #selector(showConditionView(_:)))
        contentView.addGestureRecognizer(tap)
        
        //swipe 처리
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        UserService.shared.getUserCondition() {[weak self] (data) in guard let `self` = self else {return}
            self.conditionList = data.condSummaryList!
            print(data)
            if self.conditionList.isEmpty == false {
                self.conditionTitle.text = self.gsno(self.conditionList[0].condName)
                
                self.cur_cond_idx = self.gino(self.conditionList[0].condIdx)
                
                self.noticesCount.text = "총 \(self.gino(self.conditionList[0].noticeCnt))건"
                self.noConditionView.isHidden = true
                
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shouldRemoveShadow(true); self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            print("Swipe Right")
            pageControl.currentPage = 0
            if self.conditionList.isEmpty == false {
                self.noConditionView.isHidden = true
                self.cur_cond_idx = self.gino(self.conditionList[0].condIdx)
                self.noticesCount.text = "총 \(self.gino(self.conditionList[0].noticeCnt))건"
            }
            else {
                self.noConditionView.isHidden = false
            }
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe Left")
            pageControl.currentPage = 1
            if self.conditionList.count > 1 {
                  self.noConditionView.isHidden = true
                self.cur_cond_idx = self.gino(self.conditionList[1].condIdx)
                self.noticesCount.text = "총 \(self.gino(self.conditionList[1].noticeCnt))건"
            }
            else {
                self.noConditionView.isHidden = false
            }
        }
        ConditionSettingSerive.shared.getFitConditionInfo(cond_idx: self.gino(self.cur_cond_idx)) {[weak self] (data) in guard let `self` = self else {return}
            print(data)
            self.fitConditionRes = data
            self.conditionTitle.text = self.gsno(data.condName)
            if self.gbno(data.alert) == true {
                self.checkBoxDidChange(checkbox: self.settingAlarmBtn)
            }
            self.inputTextMatchingInfo()
            
        }
        NoticeService.shared.getFitNotice(cond_idx: self.gino(self.cur_cond_idx), request_num: 3, exist_num: self.noticeList.count ) {[weak self] (data) in guard let `self` = self else {return}
            self.noticeList = data
            self.noticeTableView.reloadData()
        }
    }
    
    func checkBoxDidChange(checkbox: Checkbox) {
        if checkbox == self.settingAlarmBtn {
            self.settingAlarmBtn.isChecked = !checkbox.isChecked
        }
    }
    
    @IBAction func showConditionView(_ sender: Any) {
        if flag {
            showView()
            flag = false
        }
        else {
            hideView()
            flag = true
        }
    }
    func showView() {
        
        UIView.animate(withDuration: 0.2, animations: ({
            self.contentViewHeightConstraint.constant = 317
            self.view.layoutIfNeeded()
        }))
        showStatusArrowImg.image = UIImage(named: "icn_back_white_revers")
        let maskPath = UIBezierPath(roundedRect: contentView.bounds, byRoundingCorners: [UIRectCorner.bottomLeft, UIRectCorner.bottomRight],cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = contentView.bounds
        maskLayer.path = maskPath.cgPath
        contentView.layer.mask = maskLayer
    }
    
    func hideView() {
        UIView.animate(withDuration: 0.2, animations: ({
            self.contentView.alpha  = 1;
        }))
        UIView.animate(withDuration: 0.2, animations: ({
            self.contentViewHeightConstraint.constant = 0
            self.view.layoutIfNeeded()
        }))
        showStatusArrowImg.image = UIImage(named: "icn_back_white")
    }
    
    //초기 화면 설정 -> 조건 뷰가 보여지도록
    func initView() {
        contentViewHeightConstraint.constant = 317
        showStatusArrowImg.image = UIImage(named: "icn_back_white_revers")
    }
    
    @IBAction func editConditionBtn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CustomSettingVC") as! CustomSettingVC
        nextViewController.cur_cond_idx = self.cur_cond_idx
        nextViewController.fitConditionRes = self.fitConditionRes
        
        self.present(nextViewController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //공고 목록 보여주는 기준 바꾸기 (pickerview 띄우기)
    @IBAction func changeAlignment(_ sender: ChangeButton) {
        setupPiker()
        setupToolbar()
        
        sender.inputAccessoryView = toolbar
        
        sender.inputView = picker
        
    }
    
    //picker초기화
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
        self.picker.removeFromSuperview()
        self.toolbar.removeFromSuperview()
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
    
    //무한 스크롤링
    var pageIndex: Int = 1
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            /* increment page index to load new data set from */
            pageIndex += 1
            
            /* call API to load data from next page or just add dummy data to your datasource */
            /* Needs to be implemented */
            loadNewItemsFrom(pageIndex)
            
            /* reload tableview with new data */
            noticeTableView.reloadData()
        }
    }
    
    func loadNewItemsFrom(_: Int) {
        NoticeService.shared.getAllNotice(request_num: 20, exist_num: self.noticeList.count) {[weak self] (data) in guard let `self` = self else {return}
            
            self.noticeList += data
            print(self.noticeList.count)
            self.noticeTableView.reloadData()
            
        }
    }
    
    // 맞춤조건 설정페이지와 정보 연결
    func inputTextMatchingInfo () {
        //지역
        if self.gbno(fitConditionRes?.location?.seoul) == true {
            self.locationLabel.text? += self.location[0] + ", "
        }
        if self.gbno(fitConditionRes?.location?.busan) == true {
            self.locationLabel.text? += self.location[1] + ", "
        }
        if self.gbno(fitConditionRes?.location?.daegu) == true {
            self.locationLabel.text? += self.location[2] + ", "
        }
        if self.gbno(fitConditionRes?.location?.incheon) == true {
            self.locationLabel.text? += self.location[3] + ", "
        }
        if self.gbno(fitConditionRes?.location?.gwangju) == true {
            self.locationLabel.text? += self.location[4] + ", "
        }
        if self.gbno(fitConditionRes?.location?.daejeon) == true {
            self.locationLabel.text? += self.location[5] + ", "
        }
        if self.gbno(fitConditionRes?.location?.ulsan) == true {
            self.locationLabel.text? += self.location[6] + ", "
        }
        if self.gbno(fitConditionRes?.location?.sejong) == true {
            self.locationLabel.text? += self.location[7] + ", "
        }
        if self.gbno(fitConditionRes?.location?.gangwon) == true {
            self.locationLabel.text? += self.location[8] + ", "
        }
        if self.gbno(fitConditionRes?.location?.kyunggi) == true {
            self.locationLabel.text? += self.location[9] + ", "
        }
        if self.gbno(fitConditionRes?.location?.kyungbuk) == true {
            self.locationLabel.text? += self.location[10] + ", "
        }
        if self.gbno(fitConditionRes?.location?.kyungnam) == true {
            self.locationLabel.text? += self.location[11] + ", "
        }
        if self.gbno(fitConditionRes?.location?.jeonnam) == true {
            self.locationLabel.text? += self.location[12] + ", "
        }
        if self.gbno(fitConditionRes?.location?.jeonbuk) == true {
            self.locationLabel.text? += self.location[13] + ", "
        }
        if self.gbno(fitConditionRes?.location?.chungnam) == true {
            self.locationLabel.text? += self.location[14] + ", "
        }
        if self.gbno(fitConditionRes?.location?.chungbuk) == true {
            self.locationLabel.text? += self.location[15] + ", "
        }
        if self.gbno(fitConditionRes?.location?.jeju) == true {
            self.locationLabel.text? += self.location[16] + ", "
        }
        locationLabel.text = DoneListingWords(locationLabel)
        // 나이
        if self.gbno(fitConditionRes?.age?.twenty_less) == true {
            self.ageLabel.text? += self.age[0] + ", "
        }
        if self.gbno(fitConditionRes?.age?.twenty_forty) == true {
            self.ageLabel.text? += self.age[1] + ", "
        }
        if self.gbno(fitConditionRes?.age?.forty_more) == true {
            self.ageLabel.text? += self.age[2] + ", "
        }
        ageLabel.text = DoneListingWords(ageLabel)
    }
    func DoneListingWords (_ label: UILabel) -> String {
        var text = label.text!
        text = String(text.dropLast(2))
        return text
    }
    
}
extension SmatchingListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "DetailContent", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NoticeDetailVC") as! NoticeDetailVC
        
        let notice = self.noticeList[indexPath.row]
        print(notice.noticeIdx)
        nextViewController.notice_idx = gino(notice.noticeIdx)
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
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
        
        //        NoticeService.shared.getNoticeScrap(notice_idx: notice.noticeIdx!) {[weak self] (data) in guard let `self` = self else {return}
        //
        //            print(data.scrap)
        //            if self.gino(data.scrap) == 0 {
        //                cell.scrapActiveBtn.isHidden = true
        //                cell.scrapDeactiveBtn.isHidden = false
        //            } else {
        //                cell.scrapActiveBtn.isHidden = false
        //                cell.scrapDeactiveBtn.isHidden = true
        //            }
        //
        //        }
        return cell
    }
    
}
//delegate를 채택할 때 delegate관련 메소드만 따로 정의
//동작에 관련한 메소드만 정의함 (pickerview 자체의 뷰에 대한 것-> title 속성)
extension SmatchingListVC : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return alignment_standard[row]
        //row index에 해당하는 data 를 반환
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
