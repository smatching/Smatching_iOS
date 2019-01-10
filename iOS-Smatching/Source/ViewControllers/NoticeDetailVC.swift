//
//  NoticeDetailVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 5..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class NoticeDetailVC: UIViewController {
    
    @IBOutlet weak var scrapBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var registDate: UILabel!
    @IBOutlet weak var noticeSummary: UILabel!
    @IBOutlet weak var noticeTarget: UILabel!
    @IBOutlet weak var noticeDescription: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var insititution: UILabel!
    @IBOutlet weak var noticeTitle: UILabel!
    @IBOutlet weak var partLabel: UILabel!
    
    var noticeDetail : NoticeDetailResponse?
    var phoneNumber : String?
    var url : String?
    var notice_idx : Int?
    var checked : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        NoticeDetailService.shared.getNoticeDetailInfo(notice_idx: gino(notice_idx)){[weak self] (data) in guard let `self` = self else {return}
            print(data)
            self.noticeDetail = data
            self.noticeTitle.text = self.gsno(self.noticeDetail?.title)
            self.insititution.text = self.gsno(self.noticeDetail?.institution)
            
            self.registDate.text = self.gsno(self.noticeDetail?.reg_date)
            
            self.endDate.text = "\(self.gsno(self.noticeDetail!.start_date))  ~ \(self.gsno(self.noticeDetail!.end_date))"
            
            self.noticeDescription.text = self.gsno(self.noticeDetail!.content)
            
            self.noticeSummary.text = self.gsno(self.noticeDetail?.summary)
            
            self.noticeTarget.text = self.gsno(self.noticeDetail?.target)
            
            self.partLabel.text = self.gsno(data.part)
            
            self.phoneNumber = self.gsno(data.phone)
            
            self.url = self.gsno(data.origin_url)
        }
    }
    //전화걸기
    @IBAction func clickCallBtn(_ sender: Any) {
        if let phoneCallURL = URL(string: "tel://\(self.gsno(self.phoneNumber))") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    //링크 연결하기
    @IBAction func urlLinkToSafari(_ sender: Any) {
        if let url = URL(string: self.gsno(self.url)) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    //스크랩하기
    @IBAction func clickScrapBtn(_ sender: UIButton) {
       
        if checked ?? true {
            sender.setImage( UIImage(named:"icn_scrap_yellow"), for: .normal)
            checked = false
            //스크랩 버튼 클릭시 동작
        } else {
            sender.setImage(UIImage(named:"icn_scrap_grey"), for: .normal)
            checked = true
        }
        doScrapNotice(noticeIdx: self.gino(self.notice_idx))
    }
    
    //scrap button delegate 함수 실행
    func doScrapNotice(noticeIdx: Int) {
        print(noticeIdx)
        NoticeService.shared.putNoticeScrap(noticeIdx: noticeIdx) {
            [weak self] (data) in guard let `self` = self else {return}
        }
    }
    
    @IBAction func clickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}
