//
//  ItemCell.swift
//  CollectionViewSwipeToDelete
//
//  Created by Jozef Matus on 09/05/2017.
//  Copyright © 2017 o2. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SwipeToDeleteCollectionView

class ItemCell: SwipeToDeleteCollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith(ViewModel vm: ItemCellVM) {
        self.imageView.image = UIImage(named: vm.itemModel.image)!
        self.titleLabel.text = vm.itemModel.title
        self.subtitleLabel.text = vm.itemModel.subtitle
        super.configureWith(ViewModel: vm)
    }
    
    override func setButtonsArray() {
        let deleteButton = SwipeToDeleteButton(data: SwipeToDeleteButtonData(width: 70, color: UIColor.red, title: "DELETE", font: UIFont.boldSystemFont(ofSize: 12), actionId: "delete"))
        let deleteButton2 = SwipeToDeleteButton(data: SwipeToDeleteButtonData(width: 70, color: UIColor.blue, title: "SOMETHING", font: UIFont.boldSystemFont(ofSize: 12), actionId: "something"))
        let deleteButto3 = SwipeToDeleteButton(data: SwipeToDeleteButtonData(width: 70, color: UIColor.green, title: "SOMETHINGELSE", font: UIFont.boldSystemFont(ofSize: 12), actionId: "somethingElse"))

        self.swipeToDeleteButtons = [deleteButton, deleteButton2, deleteButto3]
    }
}
