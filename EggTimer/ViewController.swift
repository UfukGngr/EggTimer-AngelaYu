//
//  ViewController.swift
//  EggTimer


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes=["Soft" : 3, "Medium" : 4 , "Hard" : 7]
    
    var secondsPassed = 0
    var totalTime = 0
    
    var player : AVAudioPlayer?
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        totalTime = eggTimes[hardness]!
        
        secondsPassed = 0
        progressView.progress = 0.0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
        }else {
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
}
