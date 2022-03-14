//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 金城美咲 on 2022/03/13.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    var resultImage: String = "name"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultImageView.image = UIImage(named: resultImage)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
}
