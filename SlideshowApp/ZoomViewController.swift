//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 中村航 on 2021/03/16.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var zoomimage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = zoomimage
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
