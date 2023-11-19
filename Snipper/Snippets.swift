//
//  Snippets.swift
//  Snipper
//
//  Created by Fiora Tan on 19/11/23.
//

import Foundation

struct Snippet: Identifiable, Hashable {
    var id: UUID = UUID()
    var content: String
    var topic: String
}

struct Topic: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
}
