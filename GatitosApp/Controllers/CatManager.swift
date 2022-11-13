//
//  CatManager.swift
//  GatitosApp
//
//  Created by TEO on 12/11/22.
//

import Foundation

protocol gatoManagerDelegate {
    func showListCats(lista: [Cat])
}

struct Const{
    static let URL_API = "https://api.thecatapi.com/v1/breeds?=bda53789-d59e-46cd-9bc4-2936630fde39"
    static let ERROR = "Error al obtener datos de la API"
    static let ERROR_DECODING = "Error al decodificar los datos"
}

struct CatManager{
    var delegateCManager: gatoManagerDelegate?
    
    func executeAPI(){
        let urlSession = URLSession.shared
        let url = URL(string: Const.URL_API)
        
        urlSession.dataTask(with: url!){ data, response, error in
            if error != nil{
                print(Const.ERROR, error!.localizedDescription)
            }
            
            guard let data = data else{return}
            
            if let catsList = self.decoderData(catsData:data){
                // TODO: Quitar
                print("Lista de gatos:", catsList)
                
                delegateCManager?.showListCats(lista: catsList)
            
            }
            
        }.resume()
    }
    
    func decoderData(catsData:Data) -> [Cat]?{
        do{
            let decodedData = try JSONDecoder().decode([Cat].self, from: catsData)
            return decodedData
        }catch{
            print(Const.ERROR_DECODING, error.localizedDescription)
            return nil
        }
    }
}
