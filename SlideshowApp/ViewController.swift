//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 金城美咲 on 2022/03/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    var timer: Timer!
    var timer_sec: Int = 0
    var nowImage = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.resultImage = nowImage
    }
    
    func changeNext(NowImage: Int){
        UIImage(named: "img\(NowImage)")
    }
    
    @objc func updateSlide(_ timer: Timer) {
        self.timer_sec += 2
        changeNext(NowImage: nowImage)
        
        if nowImage == 1{
            nowImage = 2
        }
        else if nowImage == 2{
            nowImage = 3
        }
        else if nowImage == 3{
            nowImage = 1
        }
    }
    
    // 再生・停止ボタン
    @IBOutlet weak var startStopButton: UIButton!
    @IBAction func startStopButton(_ sender: Any) {
        if self.timer ==  nil{
            startStopButton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateSlide(_:)), userInfo: nil, repeats: true)
        }
        else{
            startStopButton.setTitle("再生", for: .normal)
            self.timer.invalidate()
            timer = nil
        }
    }
    
    //　進むボタン
    @IBAction func nextButton(_ sender: Any) {
        changeNext(NowImage: nowImage)
        timer = nil
    }
    
    // 戻るボタン
    @IBAction func backButton(_ sender: Any) {
        if nowImage == 1{
            changeNext(NowImage: 3)
            nowImage = 3
        }
        else if nowImage == 2{
            changeNext(NowImage: 1)
            nowImage = 1
        }
        else if nowImage == 3{
            changeNext(NowImage: 2)
            nowImage = 2
        }
        timer = nil
    }
    
    //var images:[UIImage] = [UIImage(named: "img1")!, UIImage(named: "img2")!, UIImage(named: "img3")!]
    //ImageView.image = images[nowImage-1]
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
}

