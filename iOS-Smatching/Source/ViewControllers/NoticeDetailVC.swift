//
//  NoticeDetailVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 5..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class NoticeDetailVC: UIViewController {

    var notice_idx : Int?
    
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
    
    var noticeDetail : NoticeDetailResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NoticeDetailService.shared.getNoticeDetailInfo(notice_idx: gino(notice_idx)){[weak self] (data) in guard let `self` = self else {return}
            print(data)
            self.noticeDetail = data
            self.noticeTitle.text = self.gsno(self.noticeDetail?.title)
            self.insititution.text = self.gsno(self.noticeDetail?.institution)
            
            self.registDate.text = self.gsno(self.noticeDetail?.reg_date)
            
            self.dueDate.text = "\(self.gsno(self.noticeDetail!.start_date))  ~ \(self.gsno(self.noticeDetail!.end_date))"
            
            self.noticeDescription.text = self.gsno(self.noticeDetail!.content)
            
            self.noticeSummary.text = self.gsno(self.noticeDetail?.summary)
            
            self.noticeTarget.text = self.gsno(self.noticeDetail?.target)
            
        }
    }
    
}
