//
//  SwipeToDeleteCellVm.swift
//  CollectionViewSwipeToDelete
//
//  Created by Jozef Matus on 14/05/2017.
//  Copyright © 2017 o2. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

typealias SwipeToDeleteActionID = String

protocol SwipeToDeleteCellVM {
    var swipeToDeleteActionsObserver: AnyObserver<SwipeToDeleteActionID> { get set }
}
