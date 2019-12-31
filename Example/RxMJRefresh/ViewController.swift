//
//  ViewController.swift
//  RxMJRefresh
//
//  Created by FuYouFang on 12/31/2019.
//  Copyright (c) 2019 FuYouFang. All rights reserved.
//

import UIKit
import MJRefresh
import RxSwift
import RxMJRefresh

class ViewController: UITableViewController {

    // MARK: UI
    
    @IBOutlet weak var refreshBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var stopBarButtonItem: UIBarButtonItem!
    // MARK:
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshHeader = MJRefreshNormalHeader()
        let refreshFotter = MJRefreshAutoNormalFooter()
        tableView.mj_header = refreshHeader
        tableView.mj_footer = refreshFotter
        
        tableView.mj_header?.rx.refresh
            .subscribe(onNext: { () in
                debugPrint("header begin refreshing")
            })
            .disposed(by: disposeBag)
        
        tableView.mj_footer?.rx.refresh
            .subscribe(onNext: { () in
                debugPrint("footer begin refreshing")
            })
            .disposed(by: disposeBag)
        
        refreshBarButtonItem.rx
            .tap
            .bind(to: refreshHeader.rx.beginRefreshing)
            .disposed(by: disposeBag)
        
        refreshBarButtonItem.rx
            .tap
            .bind(to: refreshFotter.rx.beginRefreshing)
            .disposed(by: disposeBag)
        
        stopBarButtonItem.rx
            .tap
            .bind(to: refreshHeader.rx.endRefreshing)
            .disposed(by: disposeBag)
        
        stopBarButtonItem.rx
            .tap
            .bind(to: refreshFotter.rx.endRefreshing)
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemSelected
            .map({ (indexPath) -> RxMJRefreshFooterState in
                switch indexPath.row {
                case 0:
                    return .default
                case 1:
                    return .noMoreData
                case 2:
                    return .hidden
                default:
                    return .default
                }
            })
            .bind(to: refreshFotter.rx.refreshFooterState)
            .disposed(by: disposeBag)
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
}

