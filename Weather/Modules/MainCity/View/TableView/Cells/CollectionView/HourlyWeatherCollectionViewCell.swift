

import Foundation
import UIKit

class HourlyWeatherCollectionViewCell: UITableViewCell {
        
//    var collectionView: UICollectionView!

//    let layout = UICollectionViewFlowLayout()
//    layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
    
    private enum Constants {
        static let numberOfItemsInLine: CGFloat = 3
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16

        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HourlyWeatherCellInTableViewCell.self, forCellWithReuseIdentifier: "customCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .secondarySystemBackground
//        collectionView.isPagingEnabled = false
//        collectionView.
        return collectionView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setupUi()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUi() {
        self.addSubview(collectionView)
        
        let widthScreen = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor), // constant: 24),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor), // constant: -24),
//            self.collectionView.widthAnchor.constraint(equalToConstant: widthScreen),
            self.collectionView.heightAnchor.constraint(equalToConstant: 84)
        ])
    }
    
}

extension HourlyWeatherCollectionViewCell:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? HourlyWeatherCellInTableViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
//            return cell
//        }
            
        cell.backgroundColor = UIColor.yellow
//        cell.setup(with: "Text")
        return cell
    }
    
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let insert = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
//        print("🍉 1 insert", insert)
//
//        let interItemSpacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
//        print("🍉 2 interItemSpacing", interItemSpacing)
//
//        let wight = collectionView.frame.width - (Constants.numberOfItemsInLine - 1) * interItemSpacing - insert.left - insert.right
//        print("🍉 3 wight", wight)
//
//        let itemWight = floor(wight / Constants.numberOfItemsInLine)
//        print("🍉 4 itemWight", itemWight)
//
//
//        return CGSize(width: itemWight, height: itemWight)
//    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//            let cell = cell as! CollectionViewTableViewCell
//            cell.collectionView.reloadData()
//            cell.collectionView.contentOffset = .zero
//        }
}
