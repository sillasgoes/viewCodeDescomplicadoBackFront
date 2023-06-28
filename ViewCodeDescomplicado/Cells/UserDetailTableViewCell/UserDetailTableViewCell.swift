//
//  UserDetailTableViewCell.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 28/06/23.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier = "UserDetailTableViewCell"
    
    lazy var descriptionCell: UserDetailView = {
        let view = UserDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraintsDescriptionCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        contentView.addSubview(descriptionCell)
    }
    
    func setupCell(data: DataUser) {
        descriptionCell.nameLabel.text = data.name
        descriptionCell.userImageView.image = UIImage(named: data.nameImage)
    }
    
    private func configConstraintsDescriptionCell() {
        NSLayoutConstraint.activate([
            descriptionCell.topAnchor.constraint(equalTo: topAnchor),
            descriptionCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionCell.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
