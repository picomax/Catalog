//
//  IntroViewController.swift
//  Catalog
//
//  Created by picomax on 2016. 6. 24..
//  Copyright © 2016년 picomax. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        let image =  UIImage(named: "intro")
        let height:CGFloat = (2100 * self.view.frame.size.width / 320)
        let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, height))
        imageView.image = image
        
        scrollView.addSubview(imageView)
        scrollView.contentSize = CGSizeMake(imageView.frame.size.width,  imageView.frame.size.height)
        
        print("ImageView.Frame = \(imageView.frame)")
        print("scrollView.contentsize = \(self.scrollView.contentSize)")
        */
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
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
