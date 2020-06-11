//
//  RaidDetailViewController.swift
//  1234
//
//  Created by Ilnur Bikmaev on 11.06.2020.
//  Copyright © 2020 Ilnur Bikmaev. All rights reserved.
//

import UIKit


class RaidDetailViewController: UIViewController {
    var guild: [[String]] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension RaidDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "guild", for: indexPath);
        cell.textLabel?.text = guild[indexPath.row][0];
        cell.detailTextLabel?.text = guild[indexPath.row][1];
        return cell;
    }
    
    
}
