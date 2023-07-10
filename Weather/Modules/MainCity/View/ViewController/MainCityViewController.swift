

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
//        manCityView.settingsPageControl(
//            scrollDelegate: self,
//            scrollFrame: self.view.bounds,
//            numberOfPages: 1)
        
        manCityView.configureTableView(delegateTable: self, dataSourceTable: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
}

extension MainCityViewController: MainCityViewDelegate {
    
    func showSettingsView() {
        print("showSettingsView")
        let settings = SettingsViewController()
        navigationController?.pushViewController(settings, animated: true)
    }
    
    func showPermissionToUseLocationView() {
        print("showPermissionToUseLocationView")
    }
    
    
}

//extension MainCityViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        
//        manCityView.pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
        
        
//        print(" currentPage", Int(scrollView.contentOffset.x / UIScreen.main.bounds.width))
//        print(" scrollView", scrollView.contentOffset.x)
//        print(" ---------------------------------------------")
//    }
//}

extension MainCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
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
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cardOfTheDayId") as? CardOfTheDayHeader
            else { return nil }
            
            return header
        }

        if section == 1 {
            guard
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TwentyFiveDaysLabelHeader") as? TwentyFiveDaysLabelHeader
            else { return nil }
            
            return header
        }
        
        return nil
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewCell", for: indexPath) as? HourlyWeatherCollectionViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                
                return cell
            }
            
            cell.backgroundColor = .systemBackground
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyForecastCell", for: indexPath) as? DailyForecastCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                
                return cell
            }
            
            cell.backgroundColor = .systemBackground
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
    }
    
    
    
}
