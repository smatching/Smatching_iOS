//
//  AlarmVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 11..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class AlarmVC: UIViewController {
    
    @IBOutlet weak var noNotificationView: UIView!
    @IBOutlet weak var alarmTableView: UITableView!
    
    var notificationList = [Notification]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickCloseBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension AlarmVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as! AlarmCell
        let notification = notificationList[indexPath.row]
        
        cell.alarmTitleLabel.text = "맞춤 지원사업 알림"
        cell.alarmDescripLabel.text = gsno(notification.message)
        cell.alarmDateTimeLabel.text = gsno(notification.outputTime)
        
        if notification.checked == false {
            //uiview 색 변하도록
            cell.contentView.backgroundColor = UIColor(displayP3Red: 242/255, green: 248/255, blue: 255/255, alpha: 1.0)
        }
        
        
        return cell
        
    }
}
