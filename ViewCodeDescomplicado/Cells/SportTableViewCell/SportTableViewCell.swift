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
