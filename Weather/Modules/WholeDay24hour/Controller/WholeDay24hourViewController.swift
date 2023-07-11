
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
    
}

extension WholeDay24hourViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TimetableHeader") as? WholeDay24hourTimetableHeader
            else { return nil }
            
            
//            header.setup(user: ReleaseOrTest().user)
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        
        return cell
    }
    
    
    
    
}

