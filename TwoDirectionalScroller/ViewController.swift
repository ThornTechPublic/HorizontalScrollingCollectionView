import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
    override func viewDidLoad() {
        delay(seconds: 1.0){
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let videoCell = sender as? VideoCell,
        let videoDetailPage = segue.destinationViewController as? VideoDetail {
            let movie = videoCell.movie
            videoDetailPage.movie = movie
        }
    }
}

extension ViewController : UITableViewDelegate { }

extension ViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Catalog.sharedInstance.genres[section].name
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Catalog.sharedInstance.genres.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategoryRow
        cell.genre = Catalog.sharedInstance.genres[indexPath.section]
        return cell
    }
    
}