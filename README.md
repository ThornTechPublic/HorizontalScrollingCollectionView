# Netflix Style Horizontal Scrolling with Collection Views

Now that we all know how TableViews work, lets try our hand at CollectionViews. The sample project with start with a TableView like before. But each row will contain a CollectionView, almost like a horizontal TableView if you will. You’ll recognize this independent scrolling for discovery based navigation like Netflix or the Featured section of the App Store. Also check out these other resources on this technique.

* http://ashfurrow.com/blog/putting-a-uicollectionview-in-a-uitableviewcell/ 
* http://www.raywenderlich.com/4723/how-to-make-an-interface-with-horizontal-tables-like-the-pulse-news-app-part-2 

You can apply what you already know about TableViews to CollectionViews. Both use a Delegate and DataSource. Both have a prototype cell that you dequeue and reuse. Both use sections, headers, and cells. The only trick to this tutorial is putting a CollectionView inside each TableViewCell.

## Game plan

The TableView is going to handle the vertical scrolling. Each category (action, drama, etc) is a table section that contains one header and one cell. This cell contains a horizontally scrolling CollectionView. Just remember to point the CollectionView DataSource to the cell, and everything will be just fine.

## TableView

The TableView is the top level object and has rows for each genre.

In the Storyboard, drop a TableView onto the ViewController, and nail down the constraints. Then wire up the Outlet and DataSource. Add a prototype cell, and set the identifier to “cell”. While we’re here, set the class to CategoryRow, (we’ll create this later).

<insert gif here>

Within ViewController.swift, hard-code the different categories/genres for our videos.

var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]

Each category gets its own section in the table.

```swift
func numberOfSectionsInTableView(tableView: UITableView) -> Int {
  return categories.count
}
```

Set the category/genre header title.

```swift
func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
  return categories[section]
}
```

We’re scrolling horizontally, so we’re always going to have a single row per category.

```swift
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return 1
}
```

Now, implement cellForRowAtIndexPath using the cell identifier and class name mentioned earlier.

```swift
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategoryRow
  return cell
}
```

Before we forget, let’s create that file CategoryRow.swift and subclass UITableViewCell.

```swift
class CategoryRow : UITableViewCell { }
```

## CollectionView

The TableViewCell represents the videos within a single genre. It contains a horizontally scrolling CollectionView, serving as its DataSource.

Back in the Storyboard, resize the cell to make it taller. Drop a CollectionView inside the TableViewCell, and line up the constraints. The CollectionView comes with a prototype cell, so set its identifier to “videoCell”. Now for the tricky part, wire the CollectionView’s DataSource and Delegate to the cell. It’s easier if you drag from the CollectionView’s Connections Inspector dataSource to the TableView cell in the view hierarchy.

<insert animated gif>

To pretty things up, open the Size Inspector of the CollectionView and set the Min Spacing and Section Insets all to 5.


On the Attributes Inspector, change the flow to horizontal. 

Also, set the CollectionViewCell background color to a Netflix red.

Within CategoryRow.swift, implement the CollectionView DataSource methods. Let’s hard-code 12 videos per category.

```swift
func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  return 12
}
```

Also dequeue the cell using the identifier we set in the Storyboard earlier.

```swift
func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
  let cell = collectionView.dequeueReusableCellWithReuseIdentifier("videoCell", forIndexPath: indexPath) as! UICollectionViewCell
  return cell
}
```

< add the flow delegate stuff here>

## Give it a try

That should be it. Build and run, and you should now have horizontal independently scrolling rows. 
