//
//  ViewController.swift
//  SwiftNetworkLayer
//
//  Created by mengxiangjian13@163.com on 10/15/2021.
//  Copyright (c) 2021 mengxiangjian13@163.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func makeRequest(_ sender: Any) {
        viewModel.request {
            if $0 {
                
            } else {
                
            }
        }
    }
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

