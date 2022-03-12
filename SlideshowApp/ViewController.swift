//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 金城美咲 on 2022/03/12.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    var timer_sec: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func updateTimer(_ timer: Timer) {
            self.timer_sec += 2
            //self.timerLabel.text = String(format: "%.1f", self.timer_sec)
    }
    
    
    @IBAction func startStopButton(_ sender: Any) {
        if self.timer ==  nil{
            startStopButton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
        }
    }
    

}

