//
//  ViewController.swift
//  CustomLoginDemo
//
//  Created by Sasitha Dilshan on 1/20/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    //@IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         setUpVideo()
    }
    
    func setUpElements(){
        
        Utilities.styleFilledButton(SignUpButton)
        Utilities.styleHollowButton(LoginButton)
    }
    
    func setUpVideo(){
        
        let bundlePath = Bundle.main.path(forResource: "1023624340-preview", ofType: "mp4")
        
        guard bundlePath != nil else{
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        videoPlayerLayer?.frame = CGRect(x:-self.view.frame.size.width*1.5, y:0, width: self.view.frame.size.width*4, height: self.view.frame.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        videoPlayer?.playImmediately(atRate: 0.3)
    }
    


}

