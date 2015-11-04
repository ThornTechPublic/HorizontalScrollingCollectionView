import UIKit

class ViewController: UIViewController {
    var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
        
    @IBOutlet weak var tableView: UITableView!
}

extension ViewController : UITableViewDelegate {

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCellWithIdentifier("header") as! HeaderCell
        cell.name = categories[section]
        // add a tap gesture to the section header.
        // this should be done inside the HeaderCell class,
        // but it's more convenient to have the target action in the table view
        // so you can convert the tap coordinates to a table secion.
        let tapHeader = UITapGestureRecognizer(target: self, action: "tappedOnHeader:")
        tapHeader.delegate = self
        tapHeader.numberOfTapsRequired = 1
        tapHeader.numberOfTouchesRequired = 1
        cell.contentView.addGestureRecognizer(tapHeader)
        return cell
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tappedOnHeader(gesture:UIGestureRecognizer){
        // the view that the gesture recognizer grabbed onto
        if let cellContentView = gesture.view {
            // convert tap coordinates from the section header space to the table view space
            let tappedPoint = cellContentView.convertPoint(cellContentView.bounds.origin, toView: tableView)
            // tableView.indexPathForRowAtPoint is a great method.
            // unfortunately, it does not work on section headers!
            // sadly, if you use this, it will work on every section EXCEPT for section 0 ("Action")
            // 
            // one way to get around this is to brute-force it:
            // get the rectangular area of each table section header,
            // and then see if the tapped point fits inside.
            for i in 0..<tableView.numberOfSections {
                let sectionHeaderArea = tableView.rectForHeaderInSection(i)
                if CGRectContainsPoint(sectionHeaderArea, tappedPoint) {
                    print("tapped on category:: \(categories[i])")
                }
            }
        }
    }
    
}

extension ViewController : UITableViewDataSource {
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return categories[section]
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategoryRow
        cell.categoryName = categories[indexPath.section]
        return cell
    }
    
}

// Had to add this, even though it doesn't do anything.
extension ViewController : UIGestureRecognizerDelegate { }