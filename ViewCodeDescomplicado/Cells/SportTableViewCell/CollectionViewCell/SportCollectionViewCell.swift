//
//  SportCollectionViewCell.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 29/06/23.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SportCollectionViewCell"
    
    let sportCollectionViewCellScreen = SportCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        sportCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sportCollectionViewCellScreen)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            sportCollectionViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            sportCollectionViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
            sportCollectionViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            sportCollectionViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
