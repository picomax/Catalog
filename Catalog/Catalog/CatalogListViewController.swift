//
//  CatalogListViewController.swift
//  Catalog
//
//  Created by picomax on 2016. 6. 24..
//  Copyright © 2016년 picomax. All rights reserved.
//

import UIKit

class CatalogListViewController: UIViewController {

    var catalogListManager: CatalogListManager!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        catalogListManager = CatalogListManager.sharedInstance
        catalogListManager.loadAll()
        
        tableView.rowHeight = 85
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowDetailSegue" {
            if let cell = sender as? UITableViewCell {
                
                if let destVc = segue.destinationViewController as? DetailViewController, let indexPath = self.tableView.indexPathForCell(cell) {
                    destVc.catalogModel = catalogListManager.catalogModelAtIndex(indexPath.row)
                }
                
            }
            
        }
    }
}


// MARK: - UITableViewDataSource

extension CatalogListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogListManager.totalCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CatalogListCell")!
        let catalogModel = catalogListManager.catalogModelAtIndex(indexPath.row)
        
        let photoImageView = cell.viewWithTag(101) as! UIImageView
        photoImageView.image = UIImage(named: catalogModel.photo)
        
        let titleLabel = cell.viewWithTag(102) as! UILabel
        titleLabel.text = catalogModel.title
        
        let subtitleLabel = cell.viewWithTag(103) as! UILabel
        subtitleLabel.text = catalogModel.subtitle
        
        let scoreImageView = cell.viewWithTag(104) as! UIImageView
        scoreImageView.image = UIImage(named: "star"+catalogModel.score)
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row % 2 == 1){
            cell.backgroundColor = UIColor.whiteColor()
        } else {
            cell.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        }
    }
}


// MARK: - UITableViewDelegate

extension CatalogListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didSelectRowAtIndexPath:\(indexPath.row)")
    }
}
