//
//  SportCollectionViewCellScreen.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 29/06/23.
//

import UIKit

class SportCollectionViewCellScreen: UIView {

    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
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
        addSubview(viewBackground)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: topAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
