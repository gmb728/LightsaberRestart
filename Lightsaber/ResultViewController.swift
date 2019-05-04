//
//  ResultViewController.swift
//  Lightsaber
//
//  Created by Chang Sophia on 4/26/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit
 
 
class ResultViewController: UIViewController {
   
    
     let jedis = ["Rey", "Kylo", "Yoda"]
    
    @IBOutlet weak var jediNameLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var jediImageView: UIImageView!
    @IBOutlet weak var lightsaberImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       jediNameLabel.text = newName
        
        
       
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
