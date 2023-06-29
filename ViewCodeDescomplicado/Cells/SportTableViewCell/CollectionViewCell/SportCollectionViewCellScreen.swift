//
//  SportCollectionViewCellScreen.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 29/06/23.
//

import UIKit

class SportCollectionViewCellScreen: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var sportName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        addSubview(imageView)
        addSubview(sportName)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: sportName.topAnchor, constant: -10),
            
            sportName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            sportName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            sportName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            sportName.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
