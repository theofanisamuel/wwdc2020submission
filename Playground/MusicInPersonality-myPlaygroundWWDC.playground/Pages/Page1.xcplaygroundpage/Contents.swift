//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import AVFoundation

class MyViewController: UIViewController {
    
    var audioFile: AVAudioPlayer?
    
    let cardView        = UIView()
    let videoImageView  = UIImageView()
    let titleLabel      = UILabel()
    let watchButton     = UIButton()
    let animateButton   = UIButton()
    
    var cardViewBottomConstraint: NSLayoutConstraint!
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        setupCardView()
    }
    
    
    
    @objc func playSound(){
        let path = Bundle.main.path(forResource: "jazz_audio.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioFile = try AVAudioPlayer(contentsOf: url)
            audioFile?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    
    func setupCardView() {
        view.addSubview(cardView)
        cardView.backgroundColor    = .white
        cardView.layer.cornerRadius = 12
        setupCardViewConstraints()
        
        setupVideoImageView()
        setupTitleLabel()
//        setupWatchButton()
        setupAnimateButton()
        
    }
    
    
    func setupVideoImageView() {
        cardView.addSubview(videoImageView)
        videoImageView.layer.cornerRadius  = 12
        videoImageView.layer.masksToBounds = true
        videoImageView.image               = UIImage(named: "jazz_image.jpg")
        
        setVideoImageViewConstraints()
    }

    
    func setupTitleLabel() {
        cardView.addSubview(titleLabel)
        titleLabel.text             = "You are high self-esteem, creative, outgoing and at ease"
        titleLabel.font             = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor        = .darkGray
        titleLabel.textAlignment    = .center
        titleLabel.numberOfLines    = 5
        titleLabel.lineBreakMode    = .byWordWrapping
        
        setTitleLabelConstraints()
    }
    
    
    func setupWatchButton() {
        cardView.addSubview(watchButton)
        watchButton.setTitle("Play Jazz", for: .normal)
        watchButton.setTitleColor(.white, for: .normal)
        watchButton.backgroundColor    = .red
        watchButton.layer.cornerRadius = 20
        //        watchButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        
        setWatchButtonConstraints()
    }
    
    
    func setupAnimateButton() {
        view.addSubview(animateButton)
        animateButton.setTitle("JAZZ", for: .normal)
        animateButton.setTitleColor(.white, for: .normal)
        animateButton.backgroundColor    = .blue
        animateButton.layer.cornerRadius = 12
        animateButton.addTarget(self, action: #selector(animateCard), for: .touchUpInside)
        animateButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        
        setAnimateButtonConstraints()
    }
    
    
    func setupCardViewConstraints() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 480).isActive = true
        cardViewBottomConstraint = cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600)
        cardViewBottomConstraint.isActive = true
    }
    
    
    func setVideoImageViewConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5).isActive = true
        videoImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5).isActive = true
        videoImageView.heightAnchor.constraint(equalTo: videoImageView.widthAnchor, multiplier: 3.0/4.0).isActive = true
        videoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5).isActive = true
    }
    
    
    func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30).isActive = true
        //        titleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        titleLabel.topAnchor.constraint(equalTo: videoImageView.bottomAnchor, constant: 18).isActive = true
    }
    
    
    func setWatchButtonConstraints() {
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30).isActive = true
        watchButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30).isActive = true
        watchButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        watchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        watchButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20).isActive = true
    }
    
    
    func setAnimateButtonConstraints() {
        animateButton.translatesAutoresizingMaskIntoConstraints = false
        animateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        animateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        animateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        animateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    
    @objc func animateCard() {
        cardViewBottomConstraint.constant = -120
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 600, height: 800)
PlaygroundPage.current.liveView = vc
