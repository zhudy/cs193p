//
//  ViewController.swift
//  cs193p
//
//  Created by mac mini on 2019/9/14.
//  Copyright © 2019 mac mini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount: Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("agh, 棒棒糖！")
        flipCount += 1
        flipCard(withEmoji: "🍭", on: sender)
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        print("agh, 南瓜！")
        flipCount += 1
        flipCard(withEmoji: "🎃", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        } else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

