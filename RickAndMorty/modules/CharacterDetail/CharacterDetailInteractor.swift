//
//  CharacterDetailInteractor.swift
//  RickAndMorty
//
//  Created by Patrick VONGPRASEUTH on 04/04/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class CharacterDetailInteractor {
    
    var services : APIServicesInterfaces!
    
}

// MARK: - Extensions -

extension CharacterDetailInteractor: CharacterDetailInteractorInterface {
    
    convenience init(services: APIServicesInterfaces) {
        self.init()
        self.services = services
    }
    
    
    func fetchEpisode(url: String) -> Driver<Episode> {
        return services.fetchEpisode(url)
    }
}