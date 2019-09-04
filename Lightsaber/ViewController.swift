//
//  ViewController.swift
//  Lightsaber
//
//  Created by Chang Sophia on 4/26/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation

var lightsaberImageView = ""

class ViewController: UIViewController {
 
   
 
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var jediTextField: UITextField!
    @IBOutlet weak var episodeSeg: UISegmentedControl!
    @IBOutlet weak var sideSwitch: UISwitch!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var sideLabel: UILabel!
    @IBOutlet weak var forceSlider: UISlider!
    @IBOutlet weak var lightsaberButton: UIButton!
    @IBOutlet weak var lightsaberLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var episodeLabel: UILabel!
    
   
    
    //Result View
    
    @IBOutlet weak var jediName: UILabel!
    @IBOutlet weak var jediImageView: UIImageView!
    @IBOutlet weak var lightsaberImageView: UIImageView!
    @IBOutlet weak var forceImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        jediTextField.text = ""
        forceLabel.text = "Force"
        sideLabel.text = "Side"
        episodeLabel.text = "Episode"
        episodeSeg.selectedSegmentIndex = 0
        sideSwitch.isOn = true
        lightsaberLabel.textColor = .white
        resultView.isHidden = true
       
    }
    
    //點空白處鍵盤消失
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if let url = Bundle.main.url(forResource: "star-wars-main-theme-full", withExtension: "mp3"){
            player = AVPlayer(url: url)
            player?.play()
        }
        //galaxy screen animation
        UIView.animate(withDuration: 17) {
            self.episodeImageView.center = CGPoint(x:self.episodeImageView.center.x, y: 200)}
        
    }
       
    @IBAction func seriesSegAction(_ sender: Any) {
        //收鍵盤
         self.view.endEditing(true)
      
    }
    
    
    @IBAction func episodeSegChanged(_ sender: Any) {
        
        if let url = Bundle.main.url(forResource: "d2-star-wars", withExtension: "mp3"){
            player = AVPlayer(url: url)
            player?.play()
        }
        
        episodeLabel.adjustsFontSizeToFitWidth=true
        if  episodeSeg.selectedSegmentIndex == 0 {
            episodeLabel.text = "A New Hope"
        } else  if episodeSeg.selectedSegmentIndex == 1 {
            episodeLabel.text = "The Empire Strikes Back"
        } else  if episodeSeg.selectedSegmentIndex == 2 {
            episodeLabel.text = "Return of the Jedi"
        } else  if episodeSeg.selectedSegmentIndex == 3 {
            episodeLabel.text = "The Phantom Menacei"
        } else  if episodeSeg.selectedSegmentIndex == 4 {
            episodeLabel.text = "Attack of the Clones"
        } else  if episodeSeg.selectedSegmentIndex == 5 {
            episodeLabel.text = "Revenge of the Sith"
        } else  if episodeSeg.selectedSegmentIndex == 6 {
            episodeLabel.text = "The Force Awakens"
        } else  if episodeSeg.selectedSegmentIndex == 7 {
            episodeLabel.text = "The Last Jedi"
        }
    }
    
    
    @IBAction func sideSwithChanged(_ sender: UISwitch) {
        if let url = Bundle.main.url(forResource: "BB8", withExtension: "mp3"){
            player = AVPlayer(url: url)
            player?.play()
        }
    
        if sideSwitch.isOn == true {
            sideLabel.text = "Light"
             sideLabel.textColor = .white
        } else {
            sideLabel.text = "Dark"
            sideLabel.textColor = .darkGray
           
        }
    }
        
   
    
    
    
    
     var count = Int(arc4random_uniform(6)+0)
    
    @IBAction func lightsaberButtonChanged(_ sender: UIButton) {
        if let url = Bundle.main.url(forResource: "lightsaber-sound", withExtension: "mp3"){
            player = AVPlayer(url: url)
            player?.play()
        }
        
       lightsaberLabel.adjustsFontSizeToFitWidth=true
        
        count = count + 1
        let colors = count % 7
        
       if colors == 1 {
            lightsaberLabel.textColor = .red
            lightsaberImageView.backgroundColor = .red
        } else if colors == 2 {
            lightsaberLabel.textColor = .green
            lightsaberImageView.backgroundColor = .green
        } else if colors == 3 {
            lightsaberLabel.textColor = .blue
            lightsaberImageView.backgroundColor = .blue
        } else if colors == 4 {
            lightsaberLabel.textColor = .purple
            lightsaberImageView.backgroundColor = .purple
        } else if colors == 5 {
            lightsaberLabel.textColor = .yellow
            lightsaberImageView.backgroundColor = .yellow
        } else if colors == 6 {
          lightsaberLabel.textColor = .white
          lightsaberImageView.backgroundColor = .white
       } else if colors == 7 {
        lightsaberLabel.textColor = .darkGray
        lightsaberImageView.backgroundColor = .darkGray
    }
        
    }
    
    @IBAction func powerSliderChanged(_ sender: UISlider) {
        if let url = Bundle.main.url(forResource: "lightsaber-sound", withExtension: "mp3"){
            player = AVPlayer(url: url)
            player?.play()
        }
        sender.value.round()
        sender.setValue(sender.value.rounded(), animated: true)
        forceLabel.text = Int(sender.value).description
       
    }
    
 
    @IBAction func chooseButtonPressed(_ sender: UIButton) {
        
      resultView.isHidden = false
   
        if episodeSeg.selectedSegmentIndex == 0 || episodeSeg.selectedSegmentIndex == 1 || episodeSeg.selectedSegmentIndex == 5 && sideSwitch.isOn == true{
            jediImageView.image = UIImage(named: "Luke Skywalker")
            jediTextField.text = "Luke Skywalker"
       
            if let url = Bundle.main.url(forResource: "ill-never-join-you", withExtension: "mp3"){
                player = AVPlayer(url: url)
                player?.play()
            }
            
        } else if episodeSeg.selectedSegmentIndex == 0 || episodeSeg.selectedSegmentIndex == 1 || episodeSeg.selectedSegmentIndex == 5 && sideSwitch.isOn == false {
            jediImageView.image = UIImage(named: "Darth Vader")
             jediTextField.text = "Darth Vader"
            if let url = Bundle.main.url(forResource: "you-dont-know-the-power-of-the-dark-side", withExtension: "mp3"){
                player = AVPlayer(url: url)
                player?.play()
            }
            
            
        } else if episodeSeg.selectedSegmentIndex == 2 || episodeSeg.selectedSegmentIndex == 3 || episodeSeg.selectedSegmentIndex == 4 && sideSwitch.isOn == true{
            jediImageView.image = UIImage(named: "Obi-Wan Kenobi")
            jediTextField.text = "Obi-Wan Kenobi"
            if let url = Bundle.main.url(forResource: "you-were-the-chosen-one", withExtension: "mp3"){
                player = AVPlayer(url: url)
                player?.play()
            }
            
           
          
        } else if episodeSeg.selectedSegmentIndex == 2 || episodeSeg.selectedSegmentIndex == 3 || episodeSeg.selectedSegmentIndex == 4 && sideSwitch.isOn == false {
            jediImageView.image = UIImage(named: "Anakin Skywalker")
            jediTextField.text = "Anakin Skywalker"
            quoteLabel.text = "I don't like sand"
            let speechUtterance = AVSpeechUtterance(string:quoteLabel.text!)
            speechUtterance.voice = AVSpeechSynthesisVoice(language:"en-US")
            let synthesizer = AVSpeechSynthesizer()
            speechUtterance.pitchMultiplier = 0.3
            speechUtterance.rate = 0.4
            synthesizer.speak(speechUtterance)
            
        } else if episodeSeg.selectedSegmentIndex == 6 || episodeSeg.selectedSegmentIndex == 7 && sideSwitch.isOn == true {
            jediImageView.image = UIImage(named: "Rey")
            jediTextField.text = "Rey"
            quoteLabel.text = "You will never be as powerful as Darth Vader"
            let speechUtterance = AVSpeechUtterance(string:quoteLabel.text!)
            speechUtterance.voice = AVSpeechSynthesisVoice(language:"en-US")
            let synthesizer = AVSpeechSynthesizer()
            speechUtterance.pitchMultiplier = 1
            speechUtterance.rate = 0.5
            synthesizer.speak(speechUtterance)
     
        } else if episodeSeg.selectedSegmentIndex == 6 || episodeSeg.selectedSegmentIndex == 7 && sideSwitch.isOn == false {
            jediImageView.image = UIImage(named: "Kylo Ren")
            jediTextField.text = "Kylo Ren"
            if let url = Bundle.main.url(forResource: "the-force-awakens-kylo-ren-freakout-anger-scene", withExtension: "mp3"){
                player = AVPlayer(url: url)
                player?.play()
            }
    }
       
        
        lightsaberImageView.addSubview(jediImageView)
        
       
    }
   
      var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         resultView.isHidden = true
         forceSlider.isContinuous = false
       
        
      
   
 
}

}
