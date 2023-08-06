
import Foundation
import UIKit

class SummaryOfTheDayCollectionView: UITableViewCell {
            
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SummaryOfTheDayCollectionViewCell.self, forCellWithReuseIdentifier: "SummaryOfTheDayCustomCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "summaryOfTheDayDefaultId")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
        self.contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            self.collectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

extension SummaryOfTheDayCollectionView:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SummaryOfTheDayCustomCell", for: indexPath) as? SummaryOfTheDayCollectionViewCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "summaryOfTheDayDefaultId", for: indexPath)
            return cell
        }
        
        if cell.isSelected {
            cell.setupSelect()
        } else {
            cell.setupDeselect()
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SummaryOfTheDayCollectionViewCell {
            cell.setupSelect()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SummaryOfTheDayCollectionViewCell {
            cell.setupDeselect()
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 90, height: 40)
    }
    
}
