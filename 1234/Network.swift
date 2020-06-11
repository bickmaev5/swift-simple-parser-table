//
//  Network.swift
//  1234
//
//  Created by Ilnur Bikmaev on 11.06.2020.
//  Copyright © 2020 Ilnur Bikmaev. All rights reserved.
//

import Apollo;
import Foundation;
import ApolloCore;

class Network {
  static let shared = Network()
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://bikmay-recipes.herokuapp.com/v1/graphql")!)
}
