//
//  ProfileViewController.swift
//  Twitter
//
//  Created by kin on 4/8/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tagLine: UILabel!
    @IBOutlet weak var tweetNumber: UILabel!
    @IBOutlet weak var followingNumber: UILabel!
    @IBOutlet weak var followerNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func profileData() {
        
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
