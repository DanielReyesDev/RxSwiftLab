import UIKit
import RxSwift

//example(of: "1. Creating Observables") {
//    let mostPopular: Observable<String> = Observable<String>.just(episodeV) // observable of string
//    let originalTrilogy = Observable.of(episodeIV, episodeV, episodeVI) // Observable of string
//    let prequelTrilogy = Observable.of([episodeI, episodeII, episodeIII])
//    let sequelTrilogy = Observable.from([episodeVII, episodeVIII])
//}

//example(of: "2. Subscribe") {
//    let observable = Observable.of(episodeIV, episodeV, episodeVI)
//
//    observable.subscribe { event in
//        print(event.element ?? event)
//    }
//}

//example(of: "3. Empty") {
//    let observable = Observable<Void>.empty()
//    observable
//        .subscribe(onNext: { (element) in
//            print(element)
//        }, onError: { (error) in
//            print(error)
//        }, onCompleted: {
//            print("1. Completed")
//        }, onDisposed: {
//            print("2. Disposed")
//        })
//}

//example(of: "4. Never") {
//    let observable = Observable<Any>.never()
//
//    observable
//        // Do Operator
//        .do(
//          onSubscribe: {
//            print("About to subscribe")
//        },
//          onDispose: {
//            print("Disposed")
//        })
//        // Regular Subscribe
//        .subscribe(onNext: { (element) in
//            print(element)
//        }, onError: { (error) in
//            print(error)
//        }, onCompleted: {
//            print("1. Completed")
//        }, onDisposed: {
//            print("2. Disposed")
//        })
//}


//example(of: "4. Dispose") {
//    let mostPopular = Observable.of(episodeV, episodeVI, episodeVI)
//    let subscription = mostPopular.subscribe{ (event) in
//        print(event)
//    }
//    subscription.dispose()
//}

//example(of: "5. DIsposeBag") {
//    let bag = DisposeBag()
//
//    Observable.of(episodeVII, episodeI, rogueOne)
//        .subscribe {
//            print($0)
//        }.disposed(by: bag)
//}


//example(of: "6. Create") {
//
//    enum Droid: Error {
//        case OUB12
//    }
//
//    let bag = DisposeBag()
//
//    Observable<String>.create { (observer) in
//            observer.onNext("R2-D2")
//            observer.onError(Droid.OUB12)
//            observer.onNext("C-3PO")
//            observer.onNext("K-2SO")
//            observer.onCompleted()
//            return Disposables.create()
//        }.subscribe(onNext: {
//            print($0)
//        }, onError: { (error) in
//            print("Error: \(error)")
//        }, onCompleted: {
//            print("Completed")
//        }, onDisposed: {
//            print("Disposed")
//        }).disposed(by: bag)
//
//
//}


/*
 Traits:
 
    Single:
        emits 1 onNext or error
 
    Completable:
        emits 1 completed or error event
 
    Maybe:
        emits 1 onNext, completed or error event
 */

//example(of: "7. Single") {
//    let bag = DisposeBag()
//
//    enum FileReadError: Error {
//        case fileNotFound, unreadable, encodingFailed
//    }
//
//    func loadText(from filename: String) -> Single<String> {
//        return Single.create { single in
//            let disposable = Disposables.create()
//            guard let path = Bundle.main.path(forResource: filename, ofType: "txt") else {
//                single(.error(FileReadError.fileNotFound))
//                return disposable
//            }
//            guard let data = FileManager.default.contents(atPath: path) else {
//                single(.error(FileReadError.unreadable))
//                return disposable
//            }
//            guard let content = String(data: data, encoding: .utf8) else {
//                single(.error(FileReadError.encodingFailed))
//                return disposable
//            }
//            single(.success(content))
//            return disposable
//        }
//    }
//
//    loadText(from: "ANewhope")
//        .subscribe {
//            switch $0 {
//                case .success(let string):
//                    print(string)
//                case .error(let error):
//                    print(error)
//            }
//        }.disposed(by: bag)
//}


/*
 Subjects:
 
    PublishSubject:
        Starts empty
        Emits onNext to new subscribers
 
    BehaivorSubjet:
        Starts with initial value
        Replays initial / latest value to new subscribers
 
 
    ReplaySubject:
        Starts empty but with a buffer size
        Replays buffered elements to new subscribers
 
    Variable:
        It's wrapped into a BehaviorSubject
        Starts with initial value
        replays initial / latest value to new subscribers
        automatically completes
        stores the latest value
 
 */


//example(of: "8. PublishSubject") {
//    let quotes = PublishSubject<String>()
//    quotes.onNext(itsNotMyFault)
//
//    let subscriptionOne = quotes
//        .subscribe {
//            print(label: "1)", event: $0)
//        }
//
//    quotes.on(.next(doOrDoNot))
//
//    let subscriptionTwo = quotes
//        .subscribe {
//            print(label: "2)", event: $0)
//        }
//    quotes.onNext(lackOfFaith)
//
//    subscriptionOne.dispose()
//
//
//    quotes.onNext(eyesCanDeceive)
//    quotes.onCompleted()
//
//
//    let subscriptionThree = quotes.subscribe {
//        print(label: "2)", event: $0)
//    }
//
//    quotes.onNext(stayOnTarget)
//
//    subscriptionThree.dispose()
//    subscriptionTwo.dispose()
//}

//example(of: "9. BehaiviorSubject") {
//    let bag = DisposeBag()
//
//    let quotes = BehaviorSubject.init(value: iAmYourFather)
//
//    let _ = quotes.subscribe {
//        print(label: "1)", event: $0)
//    }
//
//    quotes.onError(Quote.neverSaidThat)
//    // it will emit the latest value: the onError value
//    // subscription1 does not listen anymore
//
//    quotes.subscribe {
//        // onError value also printed here
//        print(label: "2)", event: $0)
//    }.disposed(by: bag)
//
//}

//example(of: "10. ReplaySubject") {
//    let bag = DisposeBag()
//    let subject = ReplaySubject<String>.create(bufferSize: 2)
//
//    subject.onNext(useTheForce)
//    subject.subscribe {
//        print(label: "1)", event: $0)
//    }.disposed(by: bag)
//
//    subject.onNext(theForceIsStrong)
//
//    // this subscriber will receive both events emited before it's creation due to be a replaysubject
//    subject.subscribe {
//        print(label: "2)", event: $0)
//    }
//}

example(of: "11. Variable") {
    let bag = DisposeBag()
    
    let variable = Variable(mayTheForceBeWithYou)
    print(variable.value)
    
    variable.asObservable().subscribe {
        print(label: "1)", event: $0)
    }.disposed(by: bag)
    
    variable.value = mayThe4thBeWithYou
}
