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
    var timeLeft : Int?
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentTime()
        timeRemainingLabel.text = ""
    }
    
    private func getCurrentTime() {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime) , userInfo: nil, repeats: true)
        }
    
    @IBAction func timeSelected(_ sender: UIDatePicker) {
        
    }
    
    @IBAction func startTimerButton(_ sender: UIButton) {
        timeLeft = 10
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(startCountDown) , userInfo: nil, repeats: true)
    }
    
    @objc func startCountDown() {
        if timeLeft! >= 0 {
            timeRemainingLabel.text = "\(timeLeft!)"
            timeLeft! -= 1
        }
    }
    
    @objc func currentTime() {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMM dd  yyyy hh:mm:ss"
            currentTimeLabel.text = formatter.string(from: Date())
        }
}
