//
//  ViewController.swift
//  SlideshowApp
//
//  Created by si-hasegawa on 2022/02/12.
//

import UIKit

class ViewController: UIViewController {
    
    // outletの接続
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "sample1")!,
        UIImage(named: "sample2")!,
        UIImage(named: "sample3")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[0]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (timer != nil) {
            // タイマーを停止する
            timer.invalidate()
            timer = nil
            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
            //進む・戻るButtonを有効化
            reverseButton.isEnabled = true
            forwardButton.isEnabled = true
        }
        // segueから遷移先のZoomViewControllerを取得する
        if segue.identifier == "toNext" {
            //遷移先のViewControllerを取得する
            let zoomviewcontroller = segue.destination as! ZoomViewController
            //用意した遷移先の変数に値を渡す
            zoomviewcontroller.FullScreenImage = self.imageView.image
            
        }
        
    }
    
    //進むボタン押下時の動作
    @IBAction func nextSlide(_ sender: Any) {
        
        nowIndex += 1
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
    }
    
    //戻るボタン押下時の動作
    @IBAction func preSlide(_ sender: Any) {
        
        nowIndex -= 1
        // 1枚目の画像を表示時に戻るボタンが押下された時の処理
        if (nowIndex < 0) {
            // indexを一番最後の数字に戻す
            nowIndex = imageArray.count - 1
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    
    // 再生ボタンを押した時の処理
    @IBAction func didTapStartButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            
            //進む・戻るButtonを無効化
            reverseButton.isEnabled = false
            forwardButton.isEnabled = false
            
            // 再生時の処理を実装
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
            
            //進む・戻るButtonを有効化
            reverseButton.isEnabled = true
            forwardButton.isEnabled = true
            
        }
        
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}
