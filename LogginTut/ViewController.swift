//
//  ViewController.swift
//  LogginTut
//
//  Created by Sukumar Anup Sukumaran on 23/03/19.
//  Copyright © 2019 Qaptive_Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.components = [.file,.function,.line]
        Logger.newprint("Sample print")
        Logger.myprint("hello", .info)
        Logger.myprint("hello", .warning)
        Logger.myprint("hello", .error)
        Logger.osLog()

    }


}

