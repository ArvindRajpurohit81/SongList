//
//  MovieDetailViewController.swift
//  MoviePlayer
//
//  Created by arvind Rajpurohit on 28/08/23.
//

import UIKit
import AVKit

class MovieDetailViewController: UIViewController {

    var dataSource: MovieModel?  // Need to be viewModel If get time we will move
    
    
    var playerItem: AVPlayerItem?
    var player: AVPlayer?
    var avPlayerLayer : AVPlayerLayer?
    private var index: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .yellow
        
      
        if let dataSource = self.dataSource, let videoUrl = URL(string: self.dataSource?.url.first?.url ?? "") {
          playerItem = AVPlayerItem(url: videoUrl)
          player = AVPlayer(playerItem: playerItem)
            avPlayerLayer = AVPlayerLayer(player: player)
            avPlayerLayer?.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 200)
           self.view.layer.addSublayer(avPlayerLayer!)
            player?.play()
        }
    
        
        
        
        let btnPlay = UIButton()
        btnPlay.setTitle("Play", for: .normal)
        btnPlay.backgroundColor = .blue
        btnPlay.addTarget(self, action: #selector(btnPlayClicked), for: .touchUpInside)
        
        let btnStop = UIButton()
        btnStop.setTitle("Stop", for: .normal)
        btnStop.backgroundColor = .blue
        btnStop.addTarget(self, action: #selector(btnStopClicked), for: .touchUpInside)

        
        let btnPrev = UIButton()
        btnPrev.setTitle("Prev", for: .normal)
        btnPrev.backgroundColor = .blue
        btnPrev.addTarget(self, action: #selector(btnPrevClicked), for: .touchUpInside)

        
        let btnNext = UIButton()
        btnNext.setTitle("Next", for: .normal)
        btnNext.backgroundColor = .blue
        btnNext.addTarget(self, action: #selector(btnNextClicked), for: .touchUpInside)

        
        let stackView = UIStackView(arrangedSubviews: [btnPrev, btnStop, btnPlay , btnNext])
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.frame = CGRect(x: 16, y: 500, width: UIScreen.main.bounds.width - 32, height: 80)
        self.view.addSubview(stackView)
        
    }

    
    @IBAction func btnPrevClicked(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = 0
        }
        playVideo()
    }

    @IBAction func btnStopClicked(_ sender: Any) {
        player?.pause()
    }
    
    
    @IBAction func btnPlayClicked(_ sender: Any) {
        player?.play()
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
        index += 1   // Need to be viewModel If get time we will move
        if self.dataSource?.url.count ?? 0 > index  && index >= 0 {
        } else {
            index = 2
        }
        playVideo()
    }
    
    
    private func playVideo() {
        playerItem = nil
        player = nil
        avPlayerLayer?.removeFromSuperlayer()
        if let dataSource = self.dataSource,
            let videoUrl = URL(string: self.dataSource?.url[index].url ?? "") {
            playerItem = AVPlayerItem(url: videoUrl)
            player = AVPlayer(playerItem: playerItem)
            avPlayerLayer = AVPlayerLayer(player: player)
            avPlayerLayer?.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 200)
             self.view.layer.addSublayer(avPlayerLayer!)
            player?.play()
        }
    }
    
}
