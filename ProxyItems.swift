//
//  ProxyItems.swift
//  1234
//
//  Created by Ilnur Bikmaev on 10.06.2020.
//  Copyright © 2020 Ilnur Bikmaev. All rights reserved.
//

import UIKit

class ProxyItems: NSObject {
    var sections: [String] = [];
    var items: [[ProxyItem]] = [];
    
    func addSection(section: String, item:[ProxyItem]){
        sections = sections + [section]
        items = items + [item]
    }
}
