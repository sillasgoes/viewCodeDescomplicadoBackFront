//
//  SportTableViewCell.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 28/06/23.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    var sportTableViewCellScreen = SportTableViewCellScreen()
    
    static let identifier = "SportTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        sportTableViewCellScreen.configProtocolCollectionView(delegate: self, dataSource: self)
        addSubView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        sportTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sportTableViewCellScreen)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            sportTableViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            sportTableViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
            sportTableViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            sportTableViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }
}
