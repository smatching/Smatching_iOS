//
//  NoticeCell.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 28..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit
protocol NoticeCellDelegate {
    func doScrapNotice(noticeIdx : IndexPath)
}
class NoticeCell: UITableViewCell {
   
    @IBOutlet weak var scrapActiveBtn: UIButton!
    @IBOutlet weak var scrapDeactiveBtn: UIButton!
    @IBOutlet weak var ddayLabel: UILabel!
    @IBOutlet weak var institutionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate : NoticeCellDelegate!
    var noticeIdx : IndexPath!
    
    @IBAction func doScrap(_ sender: Any) {
        self.delegate?.doScrapNotice(noticeIdx: noticeIdx)
        print("noticeidx= \(noticeIdx)")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
