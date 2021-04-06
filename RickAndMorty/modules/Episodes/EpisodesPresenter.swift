//
//  EpisodesPresenter.swift
//  RickAndMorty
//
//  Created by Patrick VONGPRASEUTH on 03/04/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class EpisodesPresenter {

    // MARK: - Private properties -
    var episodes : BehaviorRelay<[Episode]> = BehaviorRelay(value: [])
    private let disposeBag = DisposeBag()

    private let view: EpisodesViewInterface
    private let interactor: EpisodesInteractorInterface
    private let wireframe: EpisodesWireframeInterface

    // MARK: - Lifecycle -

    init(view: EpisodesViewInterface, interactor: EpisodesInteractorInterface, wireframe: EpisodesWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension EpisodesPresenter: EpisodesPresenterInterface {
    
    func getEpisodes() {
        interactor.fetchEpisodes().drive(onNext: { [unowned self] (episodes) in
            self.episodes.accept(episodes)
        }).disposed(by: disposeBag)
    }
    
    
    func goToDetail(index: Int) {
        self.wireframe.pushEpisodeDetail(episode: episodes.value[index])
    }
}
