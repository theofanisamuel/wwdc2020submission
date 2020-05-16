
import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation


public class MyViewController: UIViewController {
    
    
    let genreName: [String] = ["Jazz", "Classical", "Rap", "Opera", "Country & Western", "Reggae", "Dance", "Indie", "Bollywood", "Rock Heavy Metal", "Pop"]
    
    let descriptionType: [String] = [
            "JAZZ. High self-esteem, creative, outgoing and at ease",
            "CLASSICAL. High self-esteem, creative, introvert and at ease",
            "RAP. High self-esteem, outgoing",
            "OPERA. High self-esteem, creative, gentle",
            "COUNTRY. Hardworking and outgoing",
            "REGGAE. High self-esteem, creative, not hardworking, outgoing, gentle and at ease",
            "DANCE. Creative, outgoing, not gentle",
            "INDIE. Low self-esteem, creative, not hardworking, not outgoing, not gentle",
            "BOLLYWOOD. Creative, outgoing",
            "ROCK. Low self-esteem, creative, not hardworking, not outgoing, gentle, at ease",
            "POP. High self-esteem, not creative, not hardworking, outgoing, gentle, not at ease"
        ]
    
    let genreImage: [UIImage] = [#imageLiteral(resourceName: "jazz_image.jpg"), #imageLiteral(resourceName: "classical_image.jpg"), #imageLiteral(resourceName: "rap_image.jpg"), #imageLiteral(resourceName: "opera_image.jpg"), #imageLiteral(resourceName: "country_image.jpg"), #imageLiteral(resourceName: "reggae_image.jpg"), #imageLiteral(resourceName: "dance_image.jpg"), #imageLiteral(resourceName: "indie_image.jpg"), #imageLiteral(resourceName: "bollywood_image.jpg"), #imageLiteral(resourceName: "rock_image.jpg"), #imageLiteral(resourceName: "pop_image.jpg")]
    
    let genreAudio: [URL] = [#fileLiteral(resourceName: "jazz_audio.mp3"), #fileLiteral(resourceName: "classical_audio.mp3"), #fileLiteral(resourceName: "rap_audio.mp3"), #fileLiteral(resourceName: "opera_audio.mp3"), #fileLiteral(resourceName: "country_audio.mp3"), #fileLiteral(resourceName: "reggae_audio.mp3"), #fileLiteral(resourceName: "dance_audio.mp3"), #fileLiteral(resourceName: "indie_audio.mp3"), #fileLiteral(resourceName: "bollywood_audio.mp3"), #fileLiteral(resourceName: "rock_audio.mp3"), #fileLiteral(resourceName: "pop_audio.mp3")]
    
    
    let stackView       = UIStackView()
    let cardView        = UIView()
    let videoImageView  = UIImageView()
    let descriptionLabel      = UILabel()
    let watchButton     = UIButton()
    let animateButton   = UIButton()
    
    var audioFile: AVAudioPlayer?
    var cardViewBottomConstraint: NSLayoutConstraint!
    
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        setupStackView()
        setupAnimateButton()
        setupCardView()
    }
    
    
    @objc func playSound(){
        //          let path = Bundle.main.path(forResource: "jazz_audio.mp3", ofType:nil)!
        //          let url = URL(fileURLWithPath: path)
        
        do {
            audioFile = try AVAudioPlayer(contentsOf: #fileLiteral(resourceName: "rock_audio.mp3"))
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
        setupWatchButton()
    }
    
    
    func setupVideoImageView() {
        cardView.addSubview(videoImageView)
        videoImageView.layer.cornerRadius  = 20
        videoImageView.layer.masksToBounds = true
        videoImageView.contentMode = .scaleAspectFill
        videoImageView.image               = UIImage(named: "jazz_image.jpg")
        
        setVideoImageViewConstraints()
    }
    
    
    func setupTitleLabel() {
        cardView.addSubview(descriptionLabel)
        descriptionLabel.text = "High self-esteem, creative, outgoing and at ease"
        descriptionLabel.textColor        = .darkGray
        descriptionLabel.textAlignment    = .center
        descriptionLabel.numberOfLines    = 5
        descriptionLabel.lineBreakMode    = .byWordWrapping
        
        setDescriptionLabelConstraints()
    }
    
    
    func setupWatchButton() {
        cardView.addSubview(watchButton)
        watchButton.setTitle("Close", for: .normal)
        watchButton.setTitleColor(.white, for: .normal)
        watchButton.backgroundColor    = .red
        watchButton.layer.cornerRadius = 20
        //        watchButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        
        setWatchButtonConstraints()
    }
    
    func setupStackView(){
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 20
        addButtonsToStackView()
        setStackViewConstraints()
    }
    
    func addButtonsToStackView(){
        for i in 0 ..< 11 {
            let button = UIButton(type: .system)
            button.setTitle("\(genreName[i])", for: [])
            stackView.addArrangedSubview(button)
        }
    }
    
    func setStackViewConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
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
    
    func setAnimateButtonConstraints() {
        animateButton.translatesAutoresizingMaskIntoConstraints = false
        animateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        animateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        animateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        animateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    func setupCardViewConstraints() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cardViewBottomConstraint = cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600)
        cardViewBottomConstraint.isActive = true
    }
    
    
    func setVideoImageViewConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5).isActive = true
        videoImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5).isActive = true
        videoImageView.heightAnchor.constraint(equalTo: videoImageView.widthAnchor, multiplier: 3.0/4.0
        ).isActive = true
        videoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5).isActive = true
    }
    
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30).isActive = true
        //        titleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: videoImageView.bottomAnchor, constant: 18).isActive = true
    }
    
    
    func setWatchButtonConstraints() {
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30).isActive = true
        watchButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30).isActive = true
//          watchButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        watchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        watchButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func animateCard() {
        cardViewBottomConstraint.constant = -500
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}


//  let vc = MyViewController()
//  vc.preferredContentSize = CGSize(width: 400, height: 600)
PlaygroundPage.current.liveView = MyViewController()
