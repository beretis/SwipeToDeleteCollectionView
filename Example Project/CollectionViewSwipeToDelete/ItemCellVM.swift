//
//  ItemCellVM.swift
//  CollectionViewSwipeToDelete
//
//  Created by Jozef Matus on 11/05/2017.
//  Copyright © 2017 o2. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import SwipeToDeleteCollectionView

class ItemCellVM: SwipeToDeleteCellVM {
    
    var itemModel: ItemModel
    var swipeToDeleteActionsObserver: AnyObserver<SwipeToDeleteActionID> = AnyObserver<SwipeToDeleteActionID> { (event) in
        guard let actionId = event.element else { return }
        switch actionId {
        case "delete":
            print("test clicked")
            break
        case "something":
            print("anotherTest clicked")
            break
        case "somethingElse":
            print("somethingElse clicked")
            break
        default:
            print("i get it bitch")
            break
        }
    }
    
    init(itemModel: ItemModel) {
        self.itemModel = itemModel
    }
    
}
