//
//  ViewController.swift
//  Xylophone
//
//  Created by inGM on 20.05.2022.
//

import UIKit
// connect AV module for creating player
import AVFAudio

// Extention of UIColor to generate random colors

extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}

// Extention for views gradient

extension UIView {

    func applyGradient(isVertical: Bool, colorArray: [UIColor]) {
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
         
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isVertical {
            //top to bottom
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //left to right
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }

}


class ViewController: UIViewController {

// make outlets for buttons to make possible to set currentTitle for each button
    
    @IBOutlet weak var aLable: UIButton!
    @IBOutlet weak var bLable: UIButton!
    @IBOutlet weak var cLable: UIButton!
    @IBOutlet weak var dLable: UIButton!
    @IBOutlet weak var eLable: UIButton!
    @IBOutlet weak var fLable: UIButton!
    @IBOutlet weak var gLable: UIButton!
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Set title for each button
        aLable.setTitle("A", for: .application)
        bLable.setTitle("B", for: .application)
        cLable.setTitle("C", for: .application)
        dLable.setTitle("D", for: .application)
        eLable.setTitle("E", for: .application)
        fLable.setTitle("F", for: .application)
        gLable.setTitle("G", for: .application)
        
    
       
        aLable.configuration?.baseBackgroundColor = .red
        bLable.configuration?.baseBackgroundColor = .orange
        cLable.configuration?.baseBackgroundColor = .yellow
        dLable.configuration?.baseBackgroundColor = .green
        eLable.configuration?.baseBackgroundColor = .blue
        fLable.configuration?.baseBackgroundColor = .cyan
        gLable.configuration?.baseBackgroundColor = .purple
        
        aLable.configuration?.cornerStyle = .capsule
        bLable.configuration?.cornerStyle = .capsule
        cLable.configuration?.cornerStyle = .capsule
        dLable.configuration?.cornerStyle = .capsule
        eLable.configuration?.cornerStyle = .capsule
        fLable.configuration?.cornerStyle = .capsule
        gLable.configuration?.cornerStyle = .capsule
        
// make random gradient background
        
        self.view.applyGradient(isVertical: false, colorArray: [.systemMint, .systemCyan, .systemBlue])
    
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print(sender.titleLabel?.text as Any)
        playSound(named: sender.titleLabel?.text! ?? "")
    

 
    }
    
// Make function for play sonds
    
    func playSound(named soundName: String) {
            let audioPath = Bundle.main.path(forResource: soundName, ofType: "wav")
            player = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            player.play()
        }
    
    
}

