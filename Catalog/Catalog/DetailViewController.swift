//
//  DetailViewController.swift
//  Catalog
//
//  Created by picomax on 2016. 6. 24..
//  Copyright © 2016년 picomax. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var thumbnail1: UIImageView!
    @IBOutlet weak var thumbnail2: UIImageView!
    @IBOutlet weak var thumbnail3: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var scoreImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    var catalogModel:CatalogModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews");
        
        descLabel.sizeToFit()
        contentView.frame = CGRectMake(0, 0, self.view.frame.width, CGRectGetMaxY(descLabel.frame) + 20)
        self.scrollView.contentSize = contentView.frame.size
    }
    /*
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
        print("tap")
    }
    */
    
    @IBAction func handleTap(sender: AnyObject) {
        //let thumbnailImageView = sender.imageView as UIImageView
        //imageView.image = thumbnailImageView.image
        print("tap")
        
        
        if sender.state == .Ended {
            //println("_myHandleTap(sender.state == .Ended)")
            //let thumbImageView = sender.view as! UIImageView
            
            print("tapped view is view with tag: \(sender.view.tag)")
            switch sender.view.tag {
            case 101:
                if let thumbnail1 = catalogModel?.thumbnail1 {
                    imageView.image = UIImage(named: thumbnail1)
                }
            case 102:
                if let thumbnail2 = catalogModel?.thumbnail2 {
                    imageView.image = UIImage(named: thumbnail2)
                }
            case 103:
                if let thumbnail3 = catalogModel?.thumbnail3 {
                    imageView.image = UIImage(named: thumbnail3)
                }
            default:
                break;
            }
        }
        
    }
    
    func loadData() {
        self.title = catalogModel?.title
        
        if let photo = catalogModel?.photo {
            imageView.image = UIImage(named: photo)
        }
        
        if let thumb1 = catalogModel?.thumbnail1 {
            thumbnail1.image = UIImage(named: thumb1)
        }
        if let thumb2 = catalogModel?.thumbnail2 {
            thumbnail2.image = UIImage(named: thumb2)
        }
        if let thumb3 = catalogModel?.thumbnail3 {
            thumbnail3.image = UIImage(named: thumb3)
        }
        
        if let title = catalogModel?.title {
            titleLabel.text = title
        }
        if let subtitle = catalogModel?.subtitle {
            subTitleLabel.text = subtitle
        }
        
        if let score = catalogModel?.score {
            scoreImageView.image = UIImage(named: "star"+score)
        }
        
        if let desc = catalogModel?.desc {
            descLabel.text = desc
        }
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
