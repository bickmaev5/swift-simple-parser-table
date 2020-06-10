//
//  ViewController.swift
//  1234
//
//  Created by Ilnur Bikmaev on 15/01/2019.
//  Copyright © 2019 Ilnur Bikmaev. All rights reserved.
//

import UIKit
import SwiftSoup

class ProxyViewTableCell: UITableViewCell {
    
    @IBOutlet weak var labelIp: UILabel!
    @IBOutlet weak var labelLast: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    struct Item {
        var ip: String = "";
        var port: String = "";
        var country: String = "";
        var anonymity: String = "";
    }
    // current document
    var document: Document = Document.init("");
    var items: [Item] = [];
    var items1 = [[String]]()
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! ProxyViewTableCell;
        let proxy = items[indexPath.row];
        cell.labelIp.text = proxy.ip + proxy.port;
        cell.labelCountry.text = proxy.country;
        cell.labelLast.text = proxy.anonymity;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dowloadPage() {
        guard let url = URL(string: "https://free-proxy-list.net/") else {
            UIAlertController(title: "Huevo", message: "Ebat'", preferredStyle: .alert)
            return
        }

        do {
           // content of url
           let html = try String.init(contentsOf: url)
           // parse it into a Document
           document = try SwiftSoup.parse(html)
            parse()
           // parse css query
        } catch let error {
           // an error occurred
           UIAlertController(title: "Huevo", message: "Ebat'", preferredStyle: .alert)
        }
    }
    

    @IBAction func click(_ sender: Any) {
        dowloadPage()
    }
    
    func parse() {
        do {

            let trs: Elements = try document.select("#proxylisttable > tbody tr");
            for tr: Element in trs {
                let text: String = try tr.text();
                let texts: Array<Substring> = text.split(separator: " ");
                let newItem: Item = Item(ip: String(texts[0]), port: String(texts[1]), country: String(texts[2] + texts[3]), anonymity: String(texts[4]));
                items.append(Item(ip: newItem.ip, port: newItem.port, country: newItem.country, anonymity: newItem.anonymity))
            }
            tableView.reloadData()
//            print(items);
            print("parse complete");
            
        } catch {
            UIAlertController(title: "Ne rabotaet", message: "Vse pizdec", preferredStyle: .alert);
        }
   
    }
    
}

