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
    
    @IBOutlet weak var labelAnon: UILabel!
    @IBOutlet weak var labelIp: UILabel!
    @IBOutlet weak var labelLast: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // current document
    var document: Document = Document.init("");
    var proxyItems: [ProxyItem] = [];
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return proxyItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return proxyItems.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! ProxyViewTableCell;
        let proxy: ProxyItem = proxyItems[indexPath.row];
        cell.labelIp.text = proxy.ip + ":" + proxy.port;
        cell.labelCountry.text = proxy.country;
        cell.labelLast.text = proxy.lastCheck;
        cell.labelAnon.text = proxy.anonymity;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0;//Choose your custom row height
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loader.isHidden = true;
        tableView.isHidden = true;
    }
    
    func dowloadPage() {
        guard let url = URL(string: "https://free-proxy-list.net/") else {
            UIAlertController(title: "Ploho", message: "Sparsit ne poluchilosya", preferredStyle: .alert)
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
        loader.isHidden = false;
        dowloadPage();
    }
    
    func parse() {
        do {

            let trs: Elements = try document.select("#proxylisttable > tbody tr");
            for tr: Element in trs {
                var strings: [String] = [];
                let tds: Elements = try tr.select("td");
                for td: Element in tds {
                    strings.append(try td.text());
                };
                let item = ProxyItem(ip: strings[0], port: strings[1], country: strings[2] + " " + strings[3], anonymity: strings[4], lastCheck: strings[7]);
                proxyItems.append(item);
            }
            tableView.isHidden = false;
            btn.isHidden = true;
            loader.isHidden = true;
            tableView.reloadData()
            
        } catch {
            UIAlertController(title: "Ne rabotaet", message: "Vse slomalos", preferredStyle: .alert);
        }
   
    }
    
}

