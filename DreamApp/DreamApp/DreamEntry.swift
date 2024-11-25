//
//  DreamEntry.swift
//  Dream
//
//  Created by Yahan Yang on 11/20/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class DreamEntry: Identifiable, Hashable {
    var id: UUID = UUID()
    var Content: String
    var EntryDate: Date
    var Mood: String
   /*
    init() {
        self.Content = ""
        self.EntryDate = Date()
        self.Mood = ""
    }
    */
    init(Content: String?, EntryDate: Date, Mood: String){
        self.Content = Content ?? "Good Dream"
        self.EntryDate = EntryDate
        self.Mood = Mood
    }
}
