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
        
    }
       
    @IBAction func seriesSegAction(_ sender: Any) {
        //收鍵盤
         self.view.endEditing(true)
      
    }
    
    
    @IBAction func seriesSegChanged(_ sender: UISegmentedControl) {
        if  episodeSeg.selectedSegmentIndex == 0 {
             episodeLabel.text = "Revenge of the Sith"
             episodeLabel.font = episodeLabel.font.withSize(22)
        } else  if  episodeSeg.selectedSegmentIndex == 1 {
            episodeLabel.font = episodeLabel.font.withSize(22)
              episodeLabel.text = "The Empire Strikes"
        } else  if episodeSeg.selectedSegmentIndex == 2 {
             episodeLabel.text = "The Force Awakens"
             episodeLabel.font = episodeLabel.font.withSize(22)
        }
    }
    
    
    @IBAction func sideSwithChanged(_ sender: UISwitch) {
    
        if sideSwitch.isOn == true {
            sideLabel.text = "Light"
        } else {
            sideLabel.text = "Dark"
        }
    }
        
   
    @IBAction func powerSliderChanged(_ sender: UISlider) {
        sender.value.round()
        sender.setValue(sender.value.rounded(), animated: true)
        forceLabel.text = Int(sender.value).description
        
    }
    
  
     var count = Int(arc4random_uniform(6)+0)
    
    @IBAction func lightsaberButtonChanged(_ sender: UIButton) {

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
    
      
 
    @IBAction func chooseButtonPressed(_ sender: UIButton) {
      resultView.isHidden = false
        if episodeSeg.selectedSegmentIndex == 0 && sideSwitch.isOn == true{
            jediImageView.image = UIImage(named: "Obi-Wan Kenobi")
        } else if episodeSeg.selectedSegmentIndex == 1 && sideSwitch.isOn == true {
            jediImageView.image = UIImage(named: "Luke Skywalker")
        } else if episodeSeg.selectedSegmentIndex == 2 && sideSwitch.isOn == true {
            jediImageView.image = UIImage(named: "Rey")
        } else if episodeSeg.selectedSegmentIndex == 0 && sideSwitch.isOn == false {
            jediImageView.image = UIImage(named: "Sith")
        } else if episodeSeg.selectedSegmentIndex == 1 && sideSwitch.isOn == false {
            jediImageView.image = UIImage(named: "Dark Vader")
        } else if episodeSeg.selectedSegmentIndex == 2 && sideSwitch.isOn == false {
            jediImageView.image = UIImage(named: "Kylo Ren")
    }
        lightsaberImageView.addSubview(jediImageView)
       
    }
   
      var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
         resultView.isHidden = true
         forceSlider.isContinuous = false
        
        if let url = Bundle.main.url(forResource: "starwar", withExtension: "mp4"){
            player = AVPlayer(url: url)
            player?.play()
    }
        
     //galaxy screen animation
        UIView.animate(withDuration: 17) {
            self.episodeImageView.center = CGPoint(x:self.episodeImageView.center.x, y: 200)}
 
}

}
