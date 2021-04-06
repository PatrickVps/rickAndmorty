//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Patrick VONGPRASEUTH on 05/04/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxCocoa
import RxSwift

final class CharactersViewController: UIViewController {

    // MARK: - Public properties -
    @IBOutlet private weak var tableView : UITableView!
    private let disposeBag = DisposeBag()

    var presenter: CharactersPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Characters"
        
        presenter.getCharacters()
        
        tableView.rx.modelSelected(Character.self).subscribe { (character) in
            let index = self.tableView.indexPathForSelectedRow?.row ?? 0
            self.displayCharacterDetail(index: index)
        }.disposed(by: disposeBag)
        
        presenter.characters.bind(to: tableView.rx.items(cellIdentifier: "characterCell")){ row,item,cell in 
            cell.textLabel?.text = item.name
        }
        .disposed(by: disposeBag)
    }

}

// MARK: - Extensions -

extension CharactersViewController: CharactersViewInterface {
    func displayCharacterDetail(index: Int) {
        presenter.goToDetail(index: index)
    }
}
