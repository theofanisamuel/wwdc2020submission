//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 600, height: 800))

let genreName: [String] = ["Jazz", "Classical", "Rap", "Opera", "Country & Western", "Reggae", "Dance", "Indie", "Bollywood", "Rock Heavy Metal", "Pop"]

containerView.backgroundColor = UIColor.white

let stackView = UIStackView()
stackView.axis = .vertical
stackView.distribution = .fillEqually
stackView.alignment = .center
stackView.spacing = 10
stackView.translatesAutoresizingMaskIntoConstraints = false

for i in 0 ..< 11 {
    let button = UIButton(type: .system)
    button.setTitle("\(genreName[i])", for: [])
    button.backgroundColor = .blue
    stackView.addArrangedSubview(button)
}

containerView.addSubview(stackView)


containerView.addConstraints(
    NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[stackView]-20-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["stackView": stackView])
)

containerView.addConstraints(
    NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[stackView]-20-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["stackView": stackView])
    
)


PlaygroundPage.current.liveView = containerView
