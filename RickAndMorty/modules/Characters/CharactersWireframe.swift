//
//  CharactersWireframe.swift
//  RickAndMorty
//
//  Created by Patrick VONGPRASEUTH on 05/04/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class CharactersWireframe: BaseWireframe<CharactersViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Characters", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(withIdentifier: "CharactersViewController") as! CharactersViewController
        super.init(viewController: moduleViewController)

        let interactor = CharactersInteractor(services: ApiService())
        let presenter = CharactersPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension CharactersWireframe: CharactersWireframeInterface {
    func pushToCharacterDetail(character : Character){
        navigationController?.pushWireframe(CharacterDetailWireframe(character: character))
    }
}
