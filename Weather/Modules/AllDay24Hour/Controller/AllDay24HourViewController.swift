
import Foundation
import UIKit
import SnapKit


class AllDay24HourViewController: UIViewController {
    
    private lazy var allDay24HourView = AllDay24HourView(delegate: self)
    
    override func loadView() {
        super.loadView()
        
        view = allDay24HourView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.allDay24HourView.navigationController(navItem: navigationItem)
        self.allDay24HourView.configureTableView(delegateTable: self, dataSourceTable: self)
    }
}

extension AllDay24HourViewController: AllDay24HourViewDelegate {
    func comeBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AllDay24HourViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return 0
        }
        if section == 1 {
            return 7
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId") as? AllDay24HourTimetableHeader
            else { return nil }
            
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "customId", for: indexPath) as? AllDay24HourTimetableCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                return cell
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
    }
    
}

