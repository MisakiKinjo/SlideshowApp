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
    var nowImage:Int = 0
    var imageNames = ["img1", "img2", "img3"]
    var status: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ImageView.image = UIImage(named: imageNames[nowImage])
        startStopButton.setTitle("再生", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.resultImage = imageNames[nowImage]
    }
    
    func changeNext(NowImage: String){
        UIImage(named: NowImage)
    }
    
    @objc func updateSlide(_ timer: Timer) {
        //self.timer_sec += 2
        changeNext(NowImage: imageNames[nowImage])
        
        if nowImage == 0{
            nowImage = 1
        }
        else if nowImage == 1{
            nowImage = 2
        }
        else if nowImage == 2{
            nowImage = 0
        }
        self.ImageView.image = UIImage(named: imageNames[nowImage])
    }
    
    // 再生・停止ボタン
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBAction func startStopButton(_ sender: Any) {
        if self.timer ==  nil{
            startStopButton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateSlide(_:)), userInfo: nil, repeats: true)
            //self.nextButton.setTitleColor(UIColor.gray, for: .normal)
            //self.backButton.setTitleColor(UIColor.gray, for: .normal)
            self.nextButton.backgroundColor = UIColor.black
            self.backButton.backgroundColor = UIColor.black
            status = 1
        }
        else{
            startStopButton.setTitle("再生", for: .normal)
            self.timer.invalidate()
            timer = nil
            self.nextButton.backgroundColor = UIColor.white
            self.backButton.backgroundColor = UIColor.white
            status = 0
        }
    }
    
    //　進むボタン
    @IBAction func nextButton(_ sender: Any) {
        if status == 0{
            if nowImage == 0{
                nowImage = 1
            }
            else if nowImage == 1{
                nowImage = 2
            }
            else{
                nowImage = 0
            }
            changeNext(NowImage: imageNames[nowImage])
            self.ImageView.image = UIImage(named: imageNames[nowImage])
        }
        
        
    }
    
    // 戻るボタン
    @IBAction func backButton(_ sender: Any) {
        if status == 0{
            if nowImage == 0{
                changeNext(NowImage: imageNames[2])
                nowImage = 2
            }
            else if nowImage == 1{
                changeNext(NowImage: imageNames[0])
                nowImage = 0
            }
            else if nowImage == 2{
                changeNext(NowImage: imageNames[1])
                nowImage = 1
            }
            self.ImageView.image = UIImage(named: imageNames[nowImage])
        }
    }
    
    
    @IBAction func tapImage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
}

