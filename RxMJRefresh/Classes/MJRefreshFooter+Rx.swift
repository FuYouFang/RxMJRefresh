//
//  MJRefreshFooter+Rx.swift
//  FBSnapshotTestCase
//
//  Created by fuyoufang on 2019/12/31.
//

import Foundation
import class MJRefresh.MJRefreshFooter
import RxSwift
import RxCocoa

public enum RxMJRefreshFooterState {
    case `default`
    case noMoreData
    case hidden
}

extension RxMJRefreshFooterState: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .default: return "默认状态"
        case .noMoreData: return "没有更多数据了"
        case .hidden: return "隐藏"
        }
    }
}

extension RxMJRefreshFooterState: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return description
    }
}

public extension Reactive where Base: MJRefreshFooter {
    
    var refreshFooterState: Binder<RxMJRefreshFooterState> {
        return Binder(base) { footer, state in
            switch state {
            case .default:
                footer.isHidden = false
                footer.resetNoMoreData()
            case .noMoreData:
                footer.isHidden = false
                footer.endRefreshingWithNoMoreData()
            case .hidden:
                footer.isHidden = true
                footer.resetNoMoreData()
            }
        }
    }
}

