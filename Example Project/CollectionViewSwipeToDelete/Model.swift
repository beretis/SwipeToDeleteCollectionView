//
//  Model.swift
//  CollectionViewSwipeToDelete
//
//  Created by Jozef Matus on 09/05/2017.
//  Copyright © 2017 o2. All rights reserved.
//

import Foundation
import RxDataSources

struct ItemModel {
    var title: String
    var image: String = "BMW-2-series"
    var subtitle: String
    
    init() {
        self.title = randomString(length: 10)
        self.subtitle = randomString(length: 13)
    }
}

struct SectionOfItemModels {
    var header: String
    var items: [ItemCellVM]
}

extension SectionOfItemModels: SectionModelType {
    typealias Item = ItemCellVM
    
    init(original: SectionOfItemModels, items: [Item]) {
        self = original
        self.items = items
    }
}

