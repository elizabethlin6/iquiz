//
//  ContentView.swift
//  iQuiz
//
//  Created by Liz on 5/6/21.
//

import SwiftUI

struct Content: View {
    let quizzes = ["Mathematics": "Review basic Math!", "Marvel Super Heroes": "Avengers Assemble!", "Science": "Fun brain teasers!"]
    @State private var alert = false
    @State private var showDetails = false
    
    var body: some View {
        // body options for quizzes
        NavigationView {
            List {
                ForEach(quizzes.sorted(by: <), id: \.key) { k, v in
                    NavigationLink(destination: QuizView()) {
                        Text("Open " + k + " Quiz!")
                    }
                    HStack {
                        Image(systemName: "heart.fill")
                        VStack(alignment: .leading) {
                            Text(k).fontWeight(.bold)
                            Text(v).foregroundColor(Color.black)
                        }
                    }
                }
            }
        
            // upper right hand corner settings option
            .navigationTitle("iQuiz")
            .toolbar {
                ToolbarItem(placement:.navigationBarTrailing) {
                    Button(action: {
                        self.alert = true
                    }, label: {
                        Image(systemName: "gear").foregroundColor(.black)
                        Text("Settings").foregroundColor(.black)
                    }).alert(isPresented: $alert) { () -> Alert in
                        Alert(title: Text("Settings"),
                          message: Text("Settings go here"),
                          dismissButton: .default(Text("OK")))
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Button("Show details") {
                    showDetails.toggle()
                }

                if showDetails {
                    Text("You should follow me on Twitter: @twostraws")
                        .font(.largeTitle)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
