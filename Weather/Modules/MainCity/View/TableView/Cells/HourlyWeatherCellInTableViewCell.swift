//
//  HourlyWeatherCellInTableViewCell.swift
//  Weather
//
//  Created by Андрей Банин on 6.7.23..
//

import Foundation
import UIKit

class HourlyWeatherCellInTableViewCell: UICollectionViewCell {
    
    lazy var text: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with arrayText: String) {
        self.text.text = arrayText
    }
    
    private func setupConstraints() {
        self.addSubview(self.text)
        
        NSLayoutConstraint.activate([
            self.text.topAnchor.constraint(equalTo: self.topAnchor),
            self.text.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.text.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.text.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
