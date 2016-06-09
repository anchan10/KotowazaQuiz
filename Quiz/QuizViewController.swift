//
//  QuizViewController.swift
//  Quiz
//
//  Created by 吉成杏奈 on 2016/05/19.
//  Copyright © 2016年 吉成杏奈. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [AnyObject]()
    
    var correctAnswer: Int = 0
    
    var timerCount: Int = 10
    var timer: NSTimer = NSTimer()
    
    @IBOutlet var countTextView: UITextView!
    
    //@IBOutlet var hanteiTextView: UITextView!
    
    @IBOutlet var hanteiImageView: UIImageView!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var arrowButton: UIButton!
    
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var nihongoTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    @IBOutlet var secondLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(1,
                        target: self,
                        selector: #selector(QuizViewController.down),
                        userInfo: nil,
                        repeats: true)
        }
        
        //timerCount = 10
        
        choiceButton1.backgroundColor = UIColor(red: 0.2353, green: 0.3843, blue: 0.5059, alpha: 1.0)
        choiceButton2.backgroundColor = UIColor(red: 0.2353, green: 0.3843, blue: 0.5059, alpha: 1.0)
        choiceButton3.backgroundColor = UIColor(red: 0.2353, green: 0.3843, blue: 0.5059, alpha: 1.0)
        
        nextButton.hidden = true
        arrowButton.hidden = true
        
        secondLabel.hidden = false
        
        choiceButton1.enabled = true
        choiceButton2.enabled = true
        choiceButton3.enabled = true
        
        //hanteiImageView.hidden = true
        
        var tmpArray = [AnyObject]()
        
        tmpArray.append(["It’s no use crying over spilt ____.","覆水盆にかえらず","water","beans","milk",3,"It’s no use crying over spilt milk."])
        tmpArray.append(["Kill two _____ with one stone.","一石二鳥","rabbits","birds","sparrows",2,"Kill two birds with one stone."])
        tmpArray.append(["When the _____’s away, the _____ will play.","鬼のいぬ間に洗濯","parent-kids","devil-humans","cat-mice",3,"When the cat’s away, the mice will play."])
        tmpArray.append(["Don’t count your _____ before they are _____.","捕らぬ狸の皮算用","raccoons-captured","money-sold","chickens-hatched",3,"Don’t count your chickens before they are hatched."])
        tmpArray.append(["Let sleeping _____ lie","触らぬ神に崇りなし","cats","dogs","god",2,"Let sleeping dogs lie"])
        tmpArray.append(["Failure _____ success.","失敗は成功のもと","generates","teaches","causes",2,"Failure teaches success."])
        tmpArray.append(["The early _____ catches the _____.","早起きは三文の徳","bird-worm","hunter-moose","cop-thief",1,"The early bird catches the worm."])
        tmpArray.append(["Set a _____ to catch a _____.","蛇の道は蛇","thief","snake","hitman",1,"Set a thief to catch a thief."])
        tmpArray.append(["Many a little makes a _____.","塵も積もれば山となる","mickle","mountain","millionaire",1,"Many a little makes a mickle."])
        tmpArray.append(["Even a _____ will return.","一寸の虫にも五分の魂","fly","bug","worm",3,"Even a worm will return."])
        tmpArray.append(["He who runs after two _____ will catch neither.","二兎を追う者は一兎をも得ず","hares","rabbits","bunnies",1,"He who runs after two hares will catch neither."])
        tmpArray.append(["When one _____ shuts another opens.","捨てる神あれば拾う神あり","window","door","god",2,"When one door shuts another opens."])
        tmpArray.append(["After a _____ comes a calm.","雨降って地固まる","disaster","rain","storm",3,"After a storm comes a calm."])
        tmpArray.append(["It's like beating the _____.","のれんに腕押し","air","water","cloth",1,"It's like beating the air."])
        tmpArray.append(["Speak of the _____ and he doth appear.","うわさをすれば影","evil","devil","shadow",2,"Speak of the devil and he doth appear."])
        
        srand(UInt32(time(nil)))
        while (tmpArray.count > 0) {
            let index = Int(rand()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
        
        //timeOver()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz() {
        
        quizTextView.text = quizArray[0][0] as! String
        
        nihongoTextView.text = quizArray[0][1] as! String
        
        choiceButton1.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButton2.setTitle(quizArray[0][3] as? String, forState: .Normal)
        choiceButton3.setTitle(quizArray[0][4] as? String, forState: .Normal)
        
    }
    
    func down() {
        timerCount = timerCount - 1
        countTextView.text = String(format: "%d",timerCount)
        
        if timerCount < 0 {
            
            timer.invalidate()
            
            choiceButton1.enabled = false
            choiceButton2.enabled = false
            choiceButton3.enabled = false
            
            NSLog("タイマー動いてます！")
            
            countTextView.text = String("Time Over")
            hanteiImageView.hidden = true
            nextButton.hidden = false
            arrowButton.hidden = false
            quizTextView.text = quizArray[0][6] as! String
            secondLabel.hidden = true
            
        }
        
    }
    
    /*
    func timeOver() {
        if timerCount < 0 {
            
            timer.invalidate()
        
            countTextView.text = String("Time Over")
            hanteiImageView.hidden = true
            nextButton.hidden = false
            arrowButton.hidden = false
            quizTextView.text = quizArray[0][6] as! String
            secondLabel.hidden = true
    
        }
    }
    */
 
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][5] as! Int == sender.tag {
            correctAnswer = correctAnswer + 1
            
            //hanteiTextView.text = "Correct"
            //hanteiTextView.textColor = UIColor.redColor()
            
            hanteiImageView.image = UIImage(named: "correct_2.png")
            sender.backgroundColor = UIColor.redColor()
            
        }else {
            
            //hanteiTextView.text = "Wrong"
            //hanteiTextView.textColor = UIColor.blueColor()
            
            sender.backgroundColor = UIColor.blueColor()
            
            if quizArray[0][5] as! Int == 1{
                choiceButton1.backgroundColor = UIColor.redColor()
                
            }else if quizArray[0][5] as! Int == 2{
                choiceButton2.backgroundColor = UIColor.redColor()
                
            }else if quizArray[0][5] as! Int == 3{
                choiceButton3.backgroundColor = UIColor.redColor()
            }
            
            
            hanteiImageView.image = UIImage(named: "wrong_2.png")
            
            
        
        }
        
        if timer.valid {
            timer.invalidate()
        }
        
        choiceButton1.enabled = false
        choiceButton2.enabled = false
        choiceButton3.enabled = false
        
        hanteiImageView.hidden = false
        
        //hanteiTextView.hidden = true
        
        nextButton.hidden = false
        arrowButton.hidden = false
        
        secondLabel.hidden = false
        
        quizTextView.text = quizArray[0][6] as! String
        
    }
    
    
    @IBAction func next()  {
        quizArray.removeAtIndex(0)
        
        hanteiImageView.hidden = true
        
        if quizArray.count == 0 {
            
            timer.invalidate()

            performSegueToResult()
            
        }else {
            choiceQuiz()
            //timeOver()
            
            if !timer.valid {
                timerCount = 10
                countTextView.text = String(timerCount)
                timer = NSTimer.scheduledTimerWithTimeInterval(1,
                         target: self,
                         selector: #selector(QuizViewController.down),
                         userInfo: nil,
                         repeats: true)
            }
        }
        
        secondLabel.hidden = false
        
        choiceButton1.enabled = true
        choiceButton2.enabled = true
        choiceButton3.enabled = true
        
        /*
        if !timer.valid {
            timerCount = 10
            countTextView.text = String(timerCount)
            timer = NSTimer.scheduledTimerWithTimeInterval(1,
                        target: self,
                        selector: #selector(QuizViewController.down),
                        userInfo: nil,
                        repeats: true)
        }
        */
        
        choiceButton1.backgroundColor = UIColor(red: 0.2353, green: 0.3843, blue: 0.5059, alpha: 1.0)
        choiceButton2.backgroundColor = UIColor(red: 0.2353, green: 0.3843, blue: 0.5059, alpha: 1.0)
        choiceButton3.backgroundColor = UIColor(red: 0.2353, green: 0.3843, blue: 0.5059, alpha: 1.0)
        
        //hanteiTextView.hidden = true
        
        nextButton.hidden = true
        arrowButton.hidden = true
        
    }
    
    
    
    func performSegueToResult() {
        
        
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destinationViewController as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
