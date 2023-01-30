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
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var timeSelect: UIDatePicker!
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentTime()
        timeRemainingLabel.text = ""
    }
    
    @IBAction func startTimerButton(_ sender: UIButton) {
        if (buttonText.currentTitle == "Stop Music") {
            stopMusic()
            buttonText.setTitle("Start", for: .normal)
        }
        else {
            let date = timeSelect.date
            let components = Calendar.current.dateComponents([.hour, .minute], from: date)
            let hour = components.hour!
            let minute = components.minute!
            
            timeLeft = hour * 3600 + minute * 60
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(startCountDown) , userInfo: nil, repeats: true)
            buttonText.setTitle("Stop Music", for: .normal)
        }
    }
    
    private func getCurrentTime() {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime) , userInfo: nil, repeats: true)
    }
    
    @objc func currentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM dd  yyyy hh:mm:ss"
        currentTimeLabel.text = formatter.string(from: Date())
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        let date = dateFormatter.string(from: Date())
        
        if(date.contains(dateFormatter.amSymbol)){
            background.image = UIImage(named:"daytime")
        }
        else {
            background.image = UIImage(named:"nighttime")
        }
    }
    
    @objc func startCountDown() {
        if (timeLeft! >= 0) {
            timeRemainingLabel.text = "\(timeLeft!)"
            timeLeft! -= 1
        }
        else {
            playMusic();
        }
    }
    
    func playMusic() {
        
    }
    
    func stopMusic() {
        
    }
}
