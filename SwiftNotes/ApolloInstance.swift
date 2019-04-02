//
//  ApolloInstance.swift
//  SwiftNotes
//
//  Created by Tri Vuong on 3/29/19.
//  Copyright © 2019 Tri Vuong. All rights reserved.
//

import Foundation
import Apollo

class ApolloInstance {
    static let shared = ApolloInstance()
    
    let client: ApolloClient
    
    init() {
        client = ApolloClient(url: URL(string: "https://127.0.0.1:3000/graphql")!)
    }
}
