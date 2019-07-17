# Stretchy Headers

![][gif]

## Add a Table Header

Grab the header background image, for example [Mt. Ngauruhoe][photo] from Unsplash, add it to the asset library.

Add a table header with a hight of 300 and an image that fills the space while maintaining its aspect ratio.

![][png]

<a href="https://github.com/cmilhench/stretchy-headers/commit/946d934" target="_blank">946d934</a>

## Add a Header property

Since the table view manages its header's size and position, we'll need to create and manage our own view.

The following enables us to design our header in the storyboard, and maintain a reference so that we can manage its size and position.

```swift
headerView = tableView.tableHeaderView
tableView.tableHeaderView = nil
tableView.addSubview(headerView)
```

The header and content will overlap at this point as the table is no longer managing things.

Push the table down

```swift
tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
tableView.contentOffset = CGPoint(x: 0, y: -300)
```

Pull the header up

```swift
headerView.frame = CGRect(x: 0, y: -300, width: tableView.bounds.width, height: 300)
```

<a href="https://github.com/cmilhench/stretchy-headers/commit/5baecf1" target="_blank">5baecf1</a>

## Add scroll listener

```swift
override func scrollViewDidScroll(_ scrollView: UIScrollView) {
	var rect = CGRect(x: 0, y: -headerHeight, width: tableView.bounds.width, height: headerHeight)
	if (tableView.contentOffset.y < -headerHeight) {
		rect.origin.y = tableView.contentOffset.y
		rect.size.height = -tableView.contentOffset.y
	}
	headerView.frame = rect;
}
```

<a href="https://github.com/cmilhench/stretchy-headers/commit/7879d3e" target="_blank">7879d3e</a>

[gif]: stretchy.gif
[png]: stretchy.png
[mp4]: stretchy.mp4
[photo]: https://unsplash.com/photos/g-0dp2ycCw0
