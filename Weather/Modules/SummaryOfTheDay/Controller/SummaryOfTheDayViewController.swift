
import Foundation
import UIKit
import SnapKit

class SummaryOfTheDayViewController: UIViewController {
    
    private lazy var summaryOfTheDayView = SummaryOfTheDayView(delegate: self)
    
    override func loadView() {
        super.loadView()
        
        view = summaryOfTheDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.summaryOfTheDayView.navigationController(navItem: navigationItem)
        self.summaryOfTheDayView.configureTableView(delegateTable: self, dataSourceTable: self)
    }
}

extension SummaryOfTheDayViewController: SummaryOfTheDayViewDelegate {
    
}

extension SummaryOfTheDayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//           return 1
//        }
//        if section == 1 {
//            return 7
//        }
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            guard
//                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId") as? WholeDay24hourTimetableHeader
//            else { return nil }
//
//            return header
//        }
//        return nil
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "customId", for: indexPath) as? WholeDay24hourTimetableCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                return cell
            }
//            let abs = cell.indexPath.row
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
    }
    
}
