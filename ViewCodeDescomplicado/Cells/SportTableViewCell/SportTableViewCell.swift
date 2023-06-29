//
//  SportTableViewCell.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 28/06/23.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    var sportTableViewCellScreen = SportTableViewCellScreen()
    var dataSport: [Sport] = []
    
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
    
    func dataCollection(data: [Sport]) {
        self.dataSport = data
    }
}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSport.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
        cell?.setupCell(data: dataSport[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }
}
