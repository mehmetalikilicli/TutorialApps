//
//  ViewController.swift
//  CryptoMVVM
//
//  Created by Mehmet Ali Kılıçlı on 1.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet weak var tableView: UITableView!
    
    var colorArray = [UIColor]()

    
    private var cyrptoListViewModel : CyrptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor.red,
            UIColor.blue,
            UIColor.gray,
            UIColor.orange,
            UIColor.brown
        ]
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().getCurrencies(url: url) { cyrptos in
            if let cyrptos = cyrptos {
                self.cyrptoListViewModel = CyrptoListViewModel(cyrptoCurrencyList: cyrptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cyrptoListViewModel == nil ? 0 : self.cyrptoListViewModel.numberofRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CyrptoCell", for: indexPath) as! CyrptoTableViewCell
        
        let cryptoViewModel = self.cyrptoListViewModel.cyrptoAtIndex(indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 5]

        return cell
    }


}

