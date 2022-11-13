//
//  GatosViewController.swift
//  GatitosApp
//
//  Created by TEO on 12/11/22.
//

import UIKit

class GatosViewController: UIViewController {
    
    struct Const{
        static let IDENTIFIER = "celda"
        static let CARD = "CardTableViewCell"
    }

    @IBOutlet weak var gatosTableView: UITableView!
    
    var catManager: CatManager = CatManager()
    var cats : [Cat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCardCell()
        setCatManager()
        setTable()
        catManager.executeAPI()
    
    }
    
    private func setTable(){
        self.gatosTableView.delegate = self
        self.gatosTableView.dataSource = self
    }
    
    private func setCatManager(){
        catManager.delegateCManager = self
    }
    
    private func registerCardCell(){
        self.gatosTableView.register(UINib(nibName: Const.CARD, bundle: nil), forCellReuseIdentifier: Const.IDENTIFIER)
    }

}

extension GatosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = gatosTableView.dequeueReusableCell(withIdentifier: Const.IDENTIFIER, for: indexPath) as! CardTableViewCell
                
        celda.setUpCard(cat: cats[indexPath.row])

        return celda
    }
    
}

extension GatosViewController: gatoManagerDelegate{
    func showListCats(lista: [Cat]) {
        cats = lista
        DispatchQueue.main.async {
            self.gatosTableView.reloadData()
        }
    }
}


