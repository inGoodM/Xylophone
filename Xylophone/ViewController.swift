//
//  ViewController.swift
//  Xylophone
//
//  Created by inGM on 20.05.2022.
//

import UIKit
// connect AV module for creating player
import AVFAudio

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
        aLable.setTitle("A", for: .normal)
        bLable.setTitle("B", for: .normal)
        cLable.setTitle("C", for: .normal)
        dLable.setTitle("D", for: .normal)
        eLable.setTitle("E", for: .normal)
        fLable.setTitle("F", for: .normal)
        gLable.setTitle("G", for: .normal)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        playSound(named: sender.currentTitle!)
 
    }
    
// Make function for play sonds
    
    func playSound(named soundName: String) {
            let audioPath = Bundle.main.path(forResource: soundName, ofType: "wav")
            player = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            player.play()
        }
    
    
}

