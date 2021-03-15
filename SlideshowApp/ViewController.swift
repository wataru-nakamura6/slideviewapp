//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中村航 on 2021/03/16.
//

import UIKit

class ViewController: UIViewController {
    var image1:UIImage!
    var image2:UIImage!
    var image3:UIImage!
    var timer : Timer!
    var sec:Int = 0
    @IBOutlet weak var Stop: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var TapZoom: UITapGestureRecognizer!
    @IBOutlet weak var 進む: UIButton!
    @IBOutlet weak var 戻る: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image1 = UIImage(named:"たい焼き.png")
        image2 = UIImage(named:"酸素画像.png")
        image3 = UIImage(named:"半熟卵.png")
        imageView.image = image1
    }
    
    @IBAction func Back(_ sender: Any) {
        if imageView.image == image1{
            imageView.image = image3
        }else if imageView.image == image3{
            imageView.image = image2
        }else{
            imageView.image = image1
        }
    }
    
    @IBAction func Next(_ sender: Any) {
        if imageView.image == image1{
            imageView.image = image2
        }else if imageView.image == image2{
            imageView.image = image3
        }else{
            imageView.image = image1
        }
    }
    
    @IBAction func Slide(_ sender: Any) {
        if timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            Stop.setTitle("停止", for: .normal)
            進む.isEnabled = false
            戻る.isEnabled = false
        }else{
            self.timer.invalidate()
            timer = nil
            Stop.setTitle("再生", for: .normal)
            進む.isEnabled = true
            戻る.isEnabled = true
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        self.sec += 2
        if sec == 2{
            imageView.image = image1
        }else if sec == 4{
            imageView.image = image2
        }else{
            imageView.image = image3
            sec = 0
        }
        }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let Zoom:ZoomViewController = segue.destination as! ZoomViewController
        Zoom.zoomimage = imageView.image!
}
}

