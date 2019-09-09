//
//  ViewController.swift
//  RiddlesInTheDark
//
//  Created by Jaeson Booker on 9/6/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var formatter : DateFormatter = DateFormatter() //gets today's date
    var dateString: String = "" //to be used to get today's date
    var checkAnswerButtonActivated: Bool = false //to know when to change button's label
    
    @IBOutlet weak var checkAnswerButtonOutlet: UIButton!
    @IBAction func checkAnswerButton(_ sender: UIButton) {
        if (checkAnswerButtonActivated == false) {
            checkAnswerButtonActivated = true
            if answers[dateString] != nil {
                //gets answer from last night's riddle
                riddleView.text = answers[dateString]
            } else {
                //if there was no riddle last night
                riddleView.text = "There was no riddle last night."
            }
            //changes button label
            checkAnswerButtonOutlet.setTitle("Check Tonight's Riddle", for: .normal)
        } else {
            checkAnswerButtonActivated = false
            getRiddle()
            checkAnswerButtonOutlet.setTitle("Check Last Night's Riddle Answer", for: .normal)
        }
    }
    @IBOutlet weak var riddleView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "d/M/yy"
        dateString = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
        getRiddle()
    }
    func getRiddle() {
        if questions[dateString] != nil {
            //gets riddle for tonight
            riddleView.text = questions[dateString]
        } else {
            //if there are no riddles
            riddleView.text = "No riddle tonight, try again tomorrow."
        }
    }
}

