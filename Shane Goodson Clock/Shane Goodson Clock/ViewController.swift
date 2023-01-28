//
//  ViewController.swift
//  Shane Goodson Clock
//
//  Created by user231162 on 1/25/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCurrentTime()
    }
    
    private func getCurrentTime() {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime) , userInfo: nil, repeats: true)
        }
    
    @objc func currentTime() {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMM dd  yyyy hh:mm:ss"
            currentTimeLabel.text = formatter.string(from: Date())
        }
}

