//
//  forwardErrors.swift
//  RxSwiftExt
//
//  Created by Dang Thai Son on 5/29/17.
//  Copyright © 2017 RxSwiftCommunity. All rights reserved.
//

import RxSwift

extension ObservableType {
    /**
     Forward errors to another observer and complete source sequence if error
     - parameter observer: Destination observer to receive errors from source observable
     - returns: An observable sequence that never errors, it will completes when an error occurs in the underlying sequence
     */
    public func forwardErrors<O: ObserverType>(to observer: O) -> Observable<E> where O.E == Error {
        return self
            .do(onError: { error in
                observer.onNext(error)
            })
            .catchErrorJustComplete()
    }
}
