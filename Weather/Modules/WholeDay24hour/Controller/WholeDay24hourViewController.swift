
import Foundation
import UIKit
import SnapKit


class WholeDay24hourViewController: UIViewController {
    
    private lazy var wholeDay24hourView = WholeDay24hourView(delegate: self)
    
    override func loadView() {
        super.loadView()
        
        view = wholeDay24hourView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wholeDay24hourView.navigationController(navItem: navigationItem)
        self.wholeDay24hourView.configureTableView(delegateTable: self, dataSourceTable: self)
    }
}

extension WholeDay24hourViewController: WholeDay24hourViewDelegate {
    func comeBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension WholeDay24hourViewController: UITableViewDelegate, UITableViewDataSource {
    
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
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId") as? WholeDay24hourTimetableHeader
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "customId", for: indexPath) as? WholeDay24hourTimetableCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                return cell
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
    }
    
}

