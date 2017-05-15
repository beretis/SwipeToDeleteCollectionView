//
//  ViewModel.swift
//  CollectionViewSwipeToDelete
//
//  Created by Jozef Matus on 09/05/2017.
//  Copyright © 2017 o2. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel: RxViewModel {
    
    var sections: Variable<[SectionOfItemModels]> = Variable([])

    
    override init() {
        super.init()
        self.setupRx()
    }
    
    func setupRx() {
        self.didBecomeActive.do(onNext: { _ in
            self.randomData.bind(to: self.sections).disposed(by: self.disposeBag)
        }).subscribe().disposed(by: self.disposeBag)
    }
    
    var randomData: Observable<[SectionOfItemModels]> {
        get {
            let count = arc4random_uniform(30)
            var arrayOfData: [ItemCellVM] = []
            for _ in 0...count {
                let randomItem = ItemCellVM(itemModel: ItemModel())
                arrayOfData.append(randomItem)
            }
            return Observable.just([SectionOfItemModels(header: "HEADER", items: arrayOfData)])
        }
    }
    
}

func randomString(length: Int) -> String {
    
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    
    var randomString = ""
    
    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
}
