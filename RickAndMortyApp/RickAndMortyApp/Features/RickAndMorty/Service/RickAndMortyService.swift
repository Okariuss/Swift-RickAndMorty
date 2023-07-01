//
//  RickAndMortyService.swift
//  RickAndMortyApp
//
//  Created by Okan Orkun on 1.07.2023.
//

import Alamofire

enum RickAndMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickAndMortyService {
    func fetchAllDatas(responce: @escaping ([Result]?) -> Void )
}

struct RickAndMortyService: IRickAndMortyService {
    func fetchAllDatas(responce: @escaping ([Result]?) -> Void ) {
        AF.request(RickAndMortyServiceEndPoint.characterPath()).responseDecodable(of: RickAndMortyModel.self) { (model) in
            guard let data = model.value else {
                //error
                responce(nil)
                return
            }
            
            responce(data.results)
        }
    }
    
    
}
