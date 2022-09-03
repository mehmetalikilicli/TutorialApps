//
//  View.swift
//  CryptoVIPER
//
//  Created by Mehmet Ali Kılıçlı on 2.09.2022.
//

import Foundation
import UIKit

//Class, protocol
//Talks to -> presenter
//ViewController

protocol AnyView {
    
    var presenter : AnyPresenter? {get set}
    
    func update(with cryptos: [Crypto])
    func update(with error: String)
    
    
    
}

class CryptoViewController : UIViewController, AnyView,UITableViewDelegate, UITableViewDataSource {
    
    
    
    var presenter: AnyPresenter?
    
    var cryptos : [Crypto] = []
    
    
    
    
    private let tableView : UITableView = {
        
        let table = UITableView()
        table.register(UITableView.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
        
    }()
    
    
    private let messageLabel : UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Downloading..."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100 , y: view.frame.height / 2 - 25 , width: 200, height: 50)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cryptos[indexPath.row].currency
        content.secondaryText = cryptos[indexPath.row].price
        cell.contentConfiguration = content
        cell.backgroundColor = .yellow
        return cell    }
    
    
    func update(with cryptos: [Crypto]) {
        self.cryptos = cryptos
        self.messageLabel.isHidden = true
        self.tableView.reloadData()
        self.tableView.isHidden = false
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(cryptos[indexPath.row].currency)
        let nextViewController = DetailViewController()
        nextViewController.price = cryptos[indexPath.row].price
        nextViewController.currency = cryptos[indexPath.row].currency
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    func update(with error: String) {
        
    }
    
    
}
