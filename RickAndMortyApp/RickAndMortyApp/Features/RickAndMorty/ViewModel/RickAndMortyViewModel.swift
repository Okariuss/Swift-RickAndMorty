//
//  RickAndMortyViewModel.swift
//  RickAndMortyApp
//
//  Created by Okan Orkun on 1.07.2023.
//

import Foundation


protocol IRickAndMortyViewModel {
    func fetchItems()
    func changeLoading()
    
    var rickAndMortyCharacters: [Result] {get set}
    var rickAndMortyService: IRickAndMortyService {get}
}


class RickAndMortyViewModel: IRickAndMortyViewModel {
    
    var rickAndMortyCharacters: [Result] = []
    private var isLoading = false
    let rickAndMortyService: IRickAndMortyService
    
    init() {
        self.rickAndMortyService = RickAndMortyService()
    }
    
    func fetchItems() {
        rickAndMortyService.fetchAllDatas { [weak self] (responce) in
            self?.changeLoading()
            self?.rickAndMortyCharacters = responce ?? []
        }
    }
    
    func changeLoading() {
        
    }
    
    
    
    
}
