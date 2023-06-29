//
//  HomeViewController.swift
//  ViewCodeDescomplicado
//
//  Created by Sillas Santos on 27/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeScreen: HomeScreen?
    var dataUser: [DataUser] = [DataUser(name: "Sillas", nameImage: "menino1"),
                            DataUser(name: "Roberto", nameImage: "menino2"),
                            DataUser(name: "Welligton", nameImage: "menino3")]
    
    var dataSport: [Sport] = [Sport(name: "Futebol", nameImage: "futebol"),
                              Sport(name: "Volei", nameImage: "volei"),
                              Sport(name: "Basquete", nameImage: "basquete"),
                              Sport(name: "Futebol Americano", nameImage: "futebol-americano")]
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: dataSport)
            return cell ?? UITableViewCell()
        }
        
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setupCell(data: dataUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
