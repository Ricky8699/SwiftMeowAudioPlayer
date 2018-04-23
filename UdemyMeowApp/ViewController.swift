//
//  ViewController.swift
//  UdemyMeowApp
//
//  Created by Imam Asari on 4/23/18.
//  Copyright © 2018 Imam Asari. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    var catSound : AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true;
        //button.imageView?.contentMode = .scaleAspectFill
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }
        catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        catSound.play()
        label.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {_ in
            self.label.isHidden = true;
        }
        
        //Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {_ in self.label.isHidden = true})
        
        // timer that call function
        //Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
    }
    
    @objc func hideLabel() {
        label.isHidden = true
    }
    
}

