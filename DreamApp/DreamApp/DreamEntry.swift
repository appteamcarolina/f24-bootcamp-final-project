//
//  DreamEntry.swift
//  DreamApp
//
//  Created by Yahan Yang on 11/20/24.
//

import Foundation
import SwiftUI


//@Model

class DreamEntry {
    var Content: String
    var EntryDate: Date
    var Mood: String
    
    init() {
        self.Content = ""
        self.EntryDate = Date()
        self.Mood = ""
    }
    
    init(Content: String, EntryDate: Date, Mood: String){
        self.Content = Content
        self.EntryDate = EntryDate
        self.Mood = Mood
    }
}
