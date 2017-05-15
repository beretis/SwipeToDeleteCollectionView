//
//  ViewController.swift
//  CollectionViewSwipeToDelete
//
//  Created by Jozef Matus on 09/05/2017.
//  Copyright © 2017 o2. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa
import SwipeToDeleteCollectionView

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: SwipeToDeleteCollectionView!
    var viewModel: ViewModel!
    let dataSource: RxCollectionViewSectionedReloadDataSource<SectionOfItemModels> = RxCollectionViewSectionedReloadDataSource<SectionOfItemModels>()
    var dragingCellIndexPath: IndexPath?
    var deleteModeGR: UIGestureRecognizer = UIGestureRecognizer()
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "whatever")
        self.viewModel = ViewModel()
//        self.setupDeleteModeGR()
        self.dataSource.configureCell = { datasource, collectionView, index, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "whatever", for: index) as! ItemCell
            cell.configureWith(ViewModel: item)
            return cell
        }
        _ = viewModel.sections.asObservable().bind(to: self.collectionView.rx.items(dataSource: dataSource))
            self.collectionView.rx.itemSelected.subscribe(onNext: { item in
        }).disposed(by: self.disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewModel.active = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.viewModel.active = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
    
}



