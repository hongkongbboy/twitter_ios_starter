//
//  TweetViewController.swift
//  Twitter
//
//  Created by kin on 2/25/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var charsLimitLabel: UILabel!
    
    @IBOutlet weak var tweetTextView: UITextView! {
        didSet {
            tweetTextView.delegate = self
            tweetTextView.becomeFirstResponder()
        }
    }
    
    let countLimit = 140
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        charsLimitLabel.text = "140"
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
                
            }, failure: {(error) in
                print("Error Posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        
        // Set the max character limit
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        let remainingChars = countLimit - newText.count
        charsLimitLabel.text = String(remainingChars)
        if remainingChars > 20 {
            charsLimitLabel.textColor = UIColor.black
        }
        if remainingChars <= 20 {
            charsLimitLabel.textColor = UIColor.red
        }
        if remainingChars < 0 {
            charsLimitLabel.text = "0"
        }
        
        // The new text should be allowed? True/False
        return newText.count <= countLimit
        

        
        
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
