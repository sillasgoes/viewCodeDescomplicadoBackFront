//
//  SportTableViewCellScreen.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 28/06/23.
//

import UIKit

class SportTableViewCellScreen: UIView {
    
    lazy var colletctionView: UICollectionView = {
        let colletionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: .init())
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.showsVerticalScrollIndicator = false
        colletionView.backgroundColor = .red
        colletionView.delaysContentTouches = false
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        colletionView.setCollectionViewLayout(layout, animated: false)
        return colletionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        addSubview(colletctionView)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            colletctionView.topAnchor.constraint(equalTo: topAnchor),
            colletctionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            colletctionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            colletctionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
     }
}
