//
//  ViewController.swift
//  CatchKenny
//
//  Created by Erim Şengezer on 27.06.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    //MARK: Variables
    
    var score = 0
    var timer = Timer()
    var time = 0
    var kennyArray = [UIImageView]()
    var hideTimer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let highScore = UserDefaults.standard.object(forKey: "highscore")
//
//        if highScore == nil {
//            highScoreLabel.text = "0"
//        }
//
//        if let newScore = highScore as? Int {
//            highScoreLabel.text = "Highscore: \(newScore)"
//        }
        
        // MARK: Timer
        scoreLabel.text = "Score: \(score)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timeFunc), userInfo: nil, repeats: true)
        time = 10
        
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
        //MARK: Array (Kenny is hidden)
        
        kennyArray.append(kenny1)
        kennyArray.append(kenny2)
        kennyArray.append(kenny3)
        kennyArray.append(kenny4)
        kennyArray.append(kenny5)
        kennyArray.append(kenny6)
        kennyArray.append(kenny7)
        kennyArray.append(kenny8)
        kennyArray.append(kenny9)
        
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        hideKenny()
        
    }
    
    @objc func increaseScore() {
        
        score = score + 1
        scoreLabel.text = "Score: \(score)"
    }
    @objc func timeFunc() {
        
        time = time - 1
        timeLabel.text = String(time)
        
        if time == 0 {
            
            timer.invalidate()
            hideTimer.invalidate()
            
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            // HighScore Control
//            if self.score > Int(highScoreLabel.text!)! {
//                UserDefaults.standard.set(self.score, forKey: "highscore")
//                highScoreLabel.text = String(self.score)
//            }
            
            
            let alert = UIAlertController(title: "Oyun Bitti", message: "Süre Doldu ve Oyun Sona Erdi", preferredStyle: UIAlertController.Style.alert)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default, handler: {(UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.time = 10
                self.timeLabel.text = "\(self.time)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timeFunc), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
                
            })
            let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(replayButton)
            alert.addAction(okButton)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func hideKenny() {
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        
        kennyArray[random].isHidden = false
    }

    @IBAction func playButton(_ sender: Any) {
        self.score = 0
        self.scoreLabel.text = "Score: \(self.score)"
        self.time = 10
        self.timeLabel.text = "\(self.time)"
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timeFunc), userInfo: nil, repeats: true)
        self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
        
    }
    
}

