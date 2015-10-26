//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    var game: Hangman

    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var hButton: UIButton!
    @IBOutlet weak var iButton: UIButton!
    @IBOutlet weak var jButton: UIButton!
    @IBOutlet weak var kButton: UIButton!
    @IBOutlet weak var lButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var nButton: UIButton!
    @IBOutlet weak var oButton: UIButton!
    @IBOutlet weak var pButton: UIButton!
    @IBOutlet weak var qButton: UIButton!
    @IBOutlet weak var rButton: UIButton!
    @IBOutlet weak var sButton: UIButton!
    @IBOutlet weak var tButton: UIButton!
    @IBOutlet weak var uButton: UIButton!
    @IBOutlet weak var vButton: UIButton!
    @IBOutlet weak var wButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var yButton: UIButton!
    @IBOutlet weak var zButton: UIButton!
    @IBOutlet weak var hangmanImageView: UIImageView!
    @IBOutlet weak var knownStringTextview: UILabel!
    
    var letterButtons: [UIButton!] = []
    
    var hangmanImages: [UIImage] = [
        UIImage(named: "hangman1.png")!,
        UIImage(named: "hangman2.png")!,
        UIImage(named: "hangman3.png")!,
        UIImage(named: "hangman4.png")!,
        UIImage(named: "hangman5.png")!,
        UIImage(named: "hangman6.png")!,
        UIImage(named: "hangman7.png")!
    ]
    
    var incorrectGuesses: Int = 0
    
    required init(coder aDecoder: NSCoder) {
        
        /* Initialize game */
        game = Hangman()
        game.start()
        
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        letterButtons = [aButton, bButton, cButton, dButton, eButton, fButton, gButton, hButton, iButton, jButton, kButton, lButton, mButton, nButton, oButton, qButton, rButton, sButton, tButton, uButton, vButton, wButton, xButton, yButton, zButton]
        knownStringTextview.text = game.knownString!
    }
    
    @IBAction func didTapLetterButton(sender: UIButton) {
        let guess : Bool = game.guessLetter(sender.currentTitle!)
        sender.enabled = false
        if guess {
            sender.backgroundColor = UIColor(red: 184/255, green: 233/255, blue: 134/255, alpha: 1)
            if (game.knownString! == game.answer!) {
                disableLetterButtons()
                let alert = UIAlertController(title: "You won!", message: "Want to play again?", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "New game", style: UIAlertActionStyle.Default, handler: startNewGame))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        } else {
            sender.backgroundColor = UIColor(red: 233/255, green: 134/255, blue: 134/255, alpha: 1)
            incorrectGuesses++
            if (incorrectGuesses == 6) {
                disableLetterButtons()
                let alert = UIAlertController(title: "Game over!", message: "You made too many incorrect guesses.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Start Over", style: UIAlertActionStyle.Default, handler: startNewGame))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            hangmanImageView.image = hangmanImages[incorrectGuesses]
        }
        knownStringTextview.text = game.knownString!
    }
    
    func disableLetterButtons() {
        for button in letterButtons {
            button?.enabled = false
            button?.backgroundColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1)
        }
    }
    
    func enableLetterButtons() {
        for button in letterButtons {
            button?.enabled = true
            button?.backgroundColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1)
        }
    }
    
    @IBAction func startNewGame() {
        enableLetterButtons()
        game.start()
        knownStringTextview.text = game.knownString!
        hangmanImageView.image = hangmanImages[0]
        incorrectGuesses = 0
    }
    
    func startNewGame(alert: UIAlertAction!) {
        enableLetterButtons()
        game.start()
        knownStringTextview.text = game.knownString!
        hangmanImageView.image = hangmanImages[0]
        incorrectGuesses = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

