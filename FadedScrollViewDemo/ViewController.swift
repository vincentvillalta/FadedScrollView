//
//  ViewController.swift
//  FadedScrollViewDemo
//
//  Created by Vincent Villalta on 1/21/18.
//  Copyright © 2018 Vincent Villalta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: FadedScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fadeTop(_ sender: UISwitch) {
        self.scrollView.fadeTop = sender.isOn
        
    }
    
    @IBAction func fadeBottom(_ sender: UISwitch) {
        self.scrollView.fadeBottom = sender.isOn
    }
}

