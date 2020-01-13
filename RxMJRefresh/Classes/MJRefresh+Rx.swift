//
//  MJRefreshComponent+Rx.swift
//  FBSnapshotTestCase
//
//  Created by fuyoufang on 2019/12/31.
//

import Foundation
import MJRefresh
import RxSwift
import RxCocoa

extension MJRefreshState: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .idle:
            return "普通闲置状态"
        case .pulling:
            return "松开就可以进行刷新的状态"
        case .refreshing:
            return "正在刷新中的状态"
        case .willRefresh:
            return "即将刷新的状态"
        case .noMoreData:
            return ""
        @unknown default:
            return "所有数据加载完毕，没有更多的数据了"
        }
    }
}

class Target: NSObject, Disposable {
    private var retainSelf: Target?
    override init() {
        super.init()
        self.retainSelf = self
    }
    func dispose() {
        self.retainSelf = nil
    }
}

private final
class MJRefreshTarget<Component: MJRefreshComponent>: Target {
    weak var component: Component?
    let refreshingBlock: MJRefreshComponentRefreshingBlock
    
    init(_ component: Component, refreshingBlock: @escaping MJRefreshComponentRefreshingBlock) {
        self.refreshingBlock = refreshingBlock
        self.component = component
        super.init()
        component.setRefreshingTarget(self, refreshingAction: #selector(onRefeshing))
    }
    
    @objc func onRefeshing() {
        refreshingBlock()
    }
    
    override func dispose() {
        super.dispose()
        self.component?.refreshingBlock = nil
    }
}


extension Reactive where Base: MJRefreshComponent {
    public var refresh: ControlEvent<Void> {
        let source = Observable<Void>.create { [weak control = self.base] observer in
            if let control = control {
                control.refreshingBlock = {
                    observer.onNext(())
                }
            }
            return Disposables.create()
        }
        return ControlEvent(events: source)
    }
    
    public var beginRefreshing: Binder<Void> {
        return Binder(base) { (target, _) in
            target.isHidden = false
            target.beginRefreshing()
        }
    }
    
    public var endRefreshing: Binder<Void> {
        return Binder(base) { (target, _) in
            target.endRefreshing()
        }
    }
    
    public var isRefreshing: Binder<Bool> {
        return Binder(base) { target, isRefreshing in
            if isRefreshing && target.isRefreshing {
                return
            } else {
                target.state = !isRefreshing ? .idle : .refreshing
            }
        }
    }
    
}
