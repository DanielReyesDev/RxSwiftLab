//
//  ViewController.swift
//  RxSwiftLab
//
//  Created by Daniel Reyes Sánchez on 5/25/19.
//  Copyright © 2019 Daniel Reyes. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Observable.of("Hello RxSwift")
    }


}

