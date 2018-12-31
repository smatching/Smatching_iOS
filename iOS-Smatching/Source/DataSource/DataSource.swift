//
//  DataSource.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 31..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

final class DataSource: NSObject, UITableViewDataSource {
    private let cellIdentifier = "ConditionCell"
    fileprivate var indexPaths: Set<IndexPath> = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ConditionCell
        
        cell.state = cellIsExpanded(at: indexPath) ? .expanded : .collapsed
        
        return cell
    }
}
extension DataSource {
    func cellIsExpanded(at indexPath: IndexPath) -> Bool {
        return indexPaths.contains(indexPath)
    }
    
    func addExpandedIndexPath(_ indexPath: IndexPath) {
        indexPaths.insert(indexPath)
    }
    
    func removeExpandedIndexPath(_ indexPath: IndexPath) {
        indexPaths.remove(indexPath)
    }
}

//extension DataSource {
//    subscript(indexPath: IndexPath) -> ProgrammingLanguage {
//        return items[indexPath.row]
//    }
//}
