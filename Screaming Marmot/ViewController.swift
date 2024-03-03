//
//  ViewController.swift
//  Screaming Marmot
//
//  Created by 林郁琦 on 2024/1/8.
//

import UIKit
//加入音樂需要先import負責影音的AVFoundation
import AVFoundation

class ViewController: UIViewController {
    //宣告尖叫音效
    var screamPlayer = AVPlayer()
    //宣告尖叫次數為0
    var screamCount = 0
    //宣告點擊音效
    var touchPlayer = AVPlayer()
    //設置尖叫次數的Label
    @IBOutlet weak var screamCountLabel: UILabel!
    //設置重來一次按鈕
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設置音效檔
        let screamUrl = Bundle.main.url(forResource: "screamSound", withExtension: "m4a")!
        let screamPlayerItem = AVPlayerItem(url: screamUrl)
        screamPlayer.replaceCurrentItem(with: screamPlayerItem)
        touchPlayer = screamPlayer
        }
    //設置點擊Ah增加次數，同時發出尖叫聲
    @IBAction func touchAh(_ sender: Any) {
        screamCount += 1
        screamCountLabel.text = "\(screamCount)"
        screamPlayer.rate = 2
        screamPlayer.seek(to: .zero)
        screamPlayer.play()
        }
    //設置重來一次按鍵，點選並歸零
    @IBAction func reset(_ sender: Any) {
        screamCount = 0
        screamCountLabel.text = "0"
        }
}

