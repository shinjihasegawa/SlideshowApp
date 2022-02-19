//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by si-hasegawa on 2022/02/15.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var FullScreen: UIImageView!
    //遷移時に受け取る画像を格納する変数
    var FullScreenImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // indexの画像をstoryboardの画像にセットする
        FullScreen.image = FullScreenImage

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
