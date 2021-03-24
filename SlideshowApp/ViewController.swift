//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中村航 on 2021/03/16.
//

import UIKit

class ViewController: UIViewController {
    var images : [UIImage] = [UIImage(named:"たい焼き.png")!, UIImage(named:"酸素画像.png")!, UIImage(named:"半熟卵.png")!]
    var timer : Timer!
    var sec : Int = 2
    @IBOutlet weak var Stop: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var TapZoom: UITapGestureRecognizer!
    @IBOutlet weak var 進む: UIButton!
    @IBOutlet weak var 戻る: UIButton!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        imageView.image = images[0]
    }
    
    @IBAction func Back(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = images.count - 1
        }
        imageView.image = images[index]
    }
    
    @IBAction func Next(_ sender: Any) {
        index += 1
        if index >= images.count{
            index = 0
        }
        imageView.image = images[index]
    }
    
    @IBAction func Slide(_ sender: Any) {
        if timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            Stop.setTitle("停止", for: .normal)
            進む.isHidden = true
            戻る.isHidden = true
        }else{
            self.timer.invalidate()
            timer = nil
            Stop.setTitle("再生", for: .normal)
            進む.isHidden = false
            戻る.isHidden = false
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        index += 1
        if index >= images.count {
            index = 0
        }
        imageView.image = images[index]
        }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let Zoom:ZoomViewController = segue.destination as! ZoomViewController
        Zoom.zoomimage = imageView.image
        
        if timer != nil {
        self.timer.invalidate()
            timer = nil}
        Stop.setTitle("再生", for: .normal)
        進む.isHidden = false
        戻る.isHidden = false
}
}

