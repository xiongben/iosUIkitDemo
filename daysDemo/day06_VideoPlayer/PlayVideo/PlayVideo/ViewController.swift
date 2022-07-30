//
//  ViewController.swift
//  PlayVideo
//
//  Created by admin on 2022/7/30.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let videoButton = UIButton()
        videoButton.setTitleColor(.blue, for: .normal)
        videoButton.setTitle("Play Video", for: .normal)
        videoButton.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        self.view.addSubview(videoButton)
        videoButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        
        let audioPlayButton = UIButton()
        audioPlayButton.setTitleColor(.red, for: .normal)
        audioPlayButton.setTitle("Play Audio", for: .normal)
        audioPlayButton.frame = CGRect(x: 50, y: 150, width: 100, height: 50)
        self.view.addSubview(audioPlayButton)
        audioPlayButton.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        
        let audioPauseButton = UIButton()
        audioPauseButton.setTitleColor(.red, for: .normal)
        audioPauseButton.setTitle("Pause Audio", for: .normal)
        audioPauseButton.frame = CGRect(x: 50, y: 250, width: 100, height: 50)
        self.view.addSubview(audioPauseButton)
        audioPauseButton.addTarget(self, action: #selector(pauseAudio), for: .touchUpInside)
        
        initAudio()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        initForLockScreen()
        
    }
    
    @objc func playVideo() {
        let videoUrl = URL(string: "https://media.w3.org/2010/05/sintel/trailer.mp4")
        let player = AVPlayer(url: videoUrl!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true, completion: nil)
    }
    
    func initAudio() {
        let audioPath = Bundle.main.path(forResource: "live", ofType: "mp3")
        let audioUrl = URL(fileURLWithPath: audioPath!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {
            audioPlayer = nil
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("error")
        }
    }
    
    func initForLockScreen() {
        let imageIcon = UIImage(named: "thumb.jpeg")!
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle:"皇后大道东",
            MPMediaItemPropertyArtist:"罗大佑",
            MPMediaItemPropertyArtwork:MPMediaItemArtwork(boundsSize: imageIcon.size, requestHandler: {(size) -> UIImage in
                return imageIcon as UIImage
            }),
            MPNowPlayingInfoPropertyPlaybackRate:1.0,
            MPMediaItemPropertyPlaybackDuration:audioPlayer?.duration as Any,
            MPNowPlayingInfoPropertyElapsedPlaybackTime:audioPlayer?.currentTime as Any
        ]
    }
    
    @objc func playAudio(){
        audioPlayer?.play()
    }
    
    @objc func pauseAudio(){
        audioPlayer?.pause()
    }
    
    @objc override func remoteControlReceived(with event: UIEvent?) {
        switch event!.subtype {
        case .remoteControlPlay:
            audioPlayer?.play()
        case .remoteControlPause:
            audioPlayer?.pause()
        case .remoteControlStop:
            audioPlayer?.stop()
        default:
            break
        }
    }


}

