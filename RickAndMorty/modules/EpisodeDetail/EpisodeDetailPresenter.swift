//
//  EpisodeDetailPresenter.swift
//  RickAndMorty
//
//  Created by Patrick VONGPRASEUTH on 03/04/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxCocoa
import RxSwift

final class EpisodeDetailPresenter {

    // MARK: - Private properties -
    var episode : BehaviorRelay<Episode> = BehaviorRelay(value: Episode())
    var characters : BehaviorRelay<[Character]> = BehaviorRelay(value: [])
    private let disposeBag = DisposeBag()

    private unowned let view: EpisodeDetailViewInterface
    private let interactor: EpisodeDetailInteractorInterface
    private let wireframe: EpisodeDetailWireframeInterface

    // MARK: - Lifecycle -

    init(episode : Episode, view: EpisodeDetailViewInterface, interactor: EpisodeDetailInteractorInterface, wireframe: EpisodeDetailWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.episode.accept(episode)
    }
}

// MARK: - Extensions -

extension EpisodeDetailPresenter: EpisodeDetailPresenterInterface {
    
    func fillCharacters() {
        episode.value.characters.forEach { (url) in
            interactor.fetchCharacter(url).drive(onNext: { [unowned self] (character) in
                self.characters.append(character)
            }).disposed(by: disposeBag)
        }
    }
    
    func goToCharacterDetail(index: Int) {
        wireframe.pushCharacterDetail(character: characters.value[index])
    }
    
    
}
