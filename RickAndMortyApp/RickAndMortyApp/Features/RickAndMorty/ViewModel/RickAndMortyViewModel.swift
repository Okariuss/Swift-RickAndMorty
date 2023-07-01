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
    
    var rickAndMortyOutput: RickAndMortyOutput? { get }
    
    func setDelegate(output: RickAndMortyOutput)
}


final class RickAndMortyViewModel: IRickAndMortyViewModel {
    var rickAndMortyOutput: RickAndMortyOutput?
    
    func setDelegate(output: RickAndMortyOutput) {
        rickAndMortyOutput = output
    }
    
    
    var rickAndMortyCharacters: [Result] = []
    private var isLoading = false
    let rickAndMortyService: IRickAndMortyService
    
    init() {
        self.rickAndMortyService = RickAndMortyService()
    }
    
    func fetchItems() {
        changeLoading()
        rickAndMortyService.fetchAllDatas { [weak self] (responce) in
            self?.changeLoading()
            self?.rickAndMortyCharacters = responce ?? []
            self?.rickAndMortyOutput?.saveDatas(values: self?.rickAndMortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickAndMortyOutput?.changeLoading(isLoad: isLoading)
    }
    
    
    
    
}
