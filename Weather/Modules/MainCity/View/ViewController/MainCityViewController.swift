

import UIKit

class MainCityViewController: UIViewController {
    
    private lazy var manCityView = MainCityView(delegate: self)    
    
    override func loadView() {
        super.loadView()
        
        view = manCityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemBackground
        
        manCityView.navigationController(navItem: navigationItem, navTitle: "то что передам 7°/13° ")
        manCityView.settingsPageControl(scrollDelegate: self, numberOfPages: 2)
        manCityView.configureTableView(delegateTable: self, dataSourceTable: self)
    }


}

extension MainCityViewController: MainCityViewDelegate {
    
    func showSettingsView() {
        print("showSettingsView")
    }
    
    func showPermissionToUseLocationView() {
        print("showPermissionToUseLocationView")
    }
    
    
}

extension MainCityViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        manCityView.pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
        print(" currentPage", Int(scrollView.contentOffset.x / UIScreen.main.bounds.width))
        print(" scrollView", scrollView.contentOffset.x)
        print(" UIScreen", UIScreen.main.bounds.width)
    }
}

extension MainCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cardOfTheDayId") as? CardOfTheDayHeader else { return nil }
            
//            header.setup(user: )
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)

        cell.backgroundColor = .gray
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
}
