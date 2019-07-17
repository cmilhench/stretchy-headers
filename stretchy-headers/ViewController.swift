//
//  ViewController.swift
//  stretchy-headers
//
//  Created by Colin Milhench on 17/07/2019.
//  Copyright © 2019 Colin Milhench. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate var headerView: UIView!

    private let headerHeight: CGFloat = 300.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Little handshake to manage the view ourselves
        headerView = self.tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)

        // Position the content below the header
        self.tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        self.tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
        let rect = CGRect(x: 0, y: -headerHeight, width: tableView.bounds.width, height: headerHeight)
        headerView.frame = rect;
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var rect = CGRect(x: 0, y: -headerHeight, width: tableView.bounds.width, height: headerHeight)
        if (tableView.contentOffset.y < -headerHeight) {
            rect.origin.y = tableView.contentOffset.y
            rect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = rect;
    }
}

