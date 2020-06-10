//
//  ProxyItem.swift
//  1234
//
//  Created by Ilnur Bikmaev on 10.06.2020.
//  Copyright © 2020 Ilnur Bikmaev. All rights reserved.
//

import UIKit

class ProxyItem: NSObject {
    var ip: String = "";
    var port: String = "";
    var country: String = "";
    var anonymity: String = "";
    var lastCheck: String = "";
    override init(){}
    init(ip: String, port: String, country: String, anonymity: String, lastCheck: String) {
        self.ip = ip;
        self.port = port;
        self.country = country;
        self.anonymity = anonymity;
        self.lastCheck = lastCheck;
    }
}
