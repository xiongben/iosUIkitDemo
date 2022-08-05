//
//  ViewController.swift
//  VideoSplash
//
//  Created by admin on 2022/8/5.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {
    
    let buttonHeight:CGFloat = 56
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 50, width: 334, height: 101))
        logoImageView.image = UIImage(named: "logo.png")
        self.view.addSubview(logoImageView)
        logoImageView.center.x = self.view.center.x
        
        let loginButton = UIButton(frame: CGRect(x: 0, y: (self.view.frame.size.height - buttonHeight), width: self.view.frame.width / 2.0, height: buttonHeight))
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
        self.view.addSubview(loginButton)
        
        let signupButton = UIButton(frame: CGRect(x: self.view.frame.width / 2.0, y: (self.view.frame.size.height - buttonHeight), width: self.view.frame.width / 2.0, height: buttonHeight))
        signupButton.setTitleColor(UIColor.white, for: .normal)
        signupButton.setTitle("SIGN UP", for: .normal)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signupButton.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        self.view.addSubview(signupButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupVideoBackground()
    }
    
    func setupVideoBackground() {
        guard let path = Bundle.main.path(forResource: "moments", ofType:"mp4") else {
            debugPrint("video.mp4 not found")
            return
        }
        print(path)
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()

        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }


}

