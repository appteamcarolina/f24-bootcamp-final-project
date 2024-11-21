//
//  AddDream.swift
//  DreamApp
//
//  Created by Yahan Yang on 11/20/24.
//

import SwiftUI

struct AddDream: View {
    //@Environment(\.modelContext) private var context
    
    @State var InputDream = ""
    @State var InputDate: Date = Date()
    @State var InputMood = "Calm"
    let Moods = ["Depressed","Sad","Calm","Happy","Excited"]
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

    }
    var body: some View {
        NavigationStack{
            ZStack{
                Color("DreamInput")
                    .ignoresSafeArea()
                VStack{
                    Form{
                        Section("Write Your Dreams"){
                            TextField("", text: $InputDream, axis: .vertical)
                                .lineLimit(10, reservesSpace: true)
                                .textFieldStyle(.roundedBorder)
                            DatePicker("Date", selection: $InputDate, displayedComponents: .date)
                            Picker("Mood", selection: $InputMood){
                                ForEach(Moods, id: \.self){ mood in
                                    Text(mood)
                                }
                            }.pickerStyle(.segmented)
                        }.foregroundColor(.black)
                    }.onSubmit {
                        //addEntry()
                        InputDream = ""
                        InputDate = Date()
                        InputMood = "Calm"
                    }
                    .navigationTitle("Dream")
                    .navigationBarTitleDisplayMode(.inline)
                    
                    //SUBMIT BUTTON
                    Button{
                        //addEntry()
                        InputDream = ""
                        InputDate = Date()
                        InputMood = "Calm"
                            
                    }label:{
                        Image(systemName: "plus.diamond")
                            .font(.system(size:50))
                            .foregroundColor(.white)
                            .padding(.bottom,100)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        /*
        func addEntry() {
            let entry = DreamEntry.add(Content: InputDream, EntryDate: InputDate, Mood: InputMood)
            //context.insert(entry)
           */
        }
    }
    
    
    struct AddDream_Previews: PreviewProvider {
        static var previews: some View {
            AddDream()
        }
    }
