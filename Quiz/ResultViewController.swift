//
//  ResultViewController.swift
//  Quiz
//
//  Created by 吉成杏奈 on 2016/05/19.
//  Copyright © 2016年 吉成杏奈. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer: Int = 0
    
    @IBOutlet var resultLabel: UILabel!
    //@IBOutlet var tashiTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(correctAnswer)
        
        /*
        if correctAnswer == 10 {
            tashiTextView.text = String("パーフェクト!")
        }else if correctAnswer > 6{
            tashiTextView.text = String("あともう少し")
        }else if correctAnswer > 3 {
            tashiTextView.text = String("")
        }else{
            tashiTextView.text = String ("Try again")
        }
        */

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
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
