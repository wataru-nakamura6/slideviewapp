//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中村航 on 2021/03/16.
//

import UIKit

class ViewController: UIViewController {
    let image1 = UIImage(named:"たい焼き.png")
    let image2 = UIImage(named:"酸素画像.png")
    let image3 = UIImage(named:"半熟卵.png")
    var timer : Timer!
    var sec : Int = 2
    var image_array = [UIImage]()
    @IBOutlet weak var Stop: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var TapZoom: UITapGestureRecognizer!
    @IBOutlet weak var 進む: UIButton!
    @IBOutlet weak var 戻る: UIButton!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image_array = [image1! , image2! , image3!]
        imageView.image = image_array[0]
    }
    
    @IBAction func Back(_ sender: Any) {
        imageView.image = image_array[count]
        count -= 1
        if count == -1 {
            count = 2
        }
    }
    
    @IBAction func Next(_ sender: Any) {
        imageView.image = image_array[count]
        count += 1
        if count == 3{
            count = 0
        }
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
        self.sec += 2
        imageView.image = image_array[count]
        if sec == 2{
            count = 0
        }else if sec == 4{
            count = 1
        }else{
            count = 2
            sec = 0
        }
        }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let Zoom:ZoomViewController = segue.destination as! ZoomViewController
        Zoom.zoomimage = imageView.image
}
}

