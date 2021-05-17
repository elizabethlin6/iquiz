//
//  QuizView.swift
//  iQuiz
//
//  Created by Liz on 5/13/21.
//

import SwiftUI

struct QuizView: View {
    
    @State private var correct = 0
    @State private var score: Int = 0
    @State private var currentQuestionNumber = 1
//    @State private var questionsArray = [Question]()
    
    struct Question {
        let questionText: String
        let options: [String]
        let correctAns: String
        var isAnswered: Bool
    }
    
    // list of question from quizzes
    func loadQuestions() {
        
        var questionsArray = [Question]()
        let que1 = Question(questionText: "What is Iron Man's real name?", options: ["Iron Man", "Tony Stank", "Tony Stark", "Robert Downey Junior"], correctAns: "Tony Stark", isAnswered: false)
        let que2 = Question(questionText: "How did Captain America get his shield?", options: ["From Iron Man", "From Iron Man's Father", "He made it", "From the Winter Soldier"], correctAns: "From Iron Man's Father", isAnswered: false)
        let que3 = Question(questionText: "Why did Groot become small?", options: ["He cut himself", "Someone cut him down", "He was in a fire", "The Infinity Stone took part of him"], correctAns: "Someone cut him down", isAnswered: false)
        questionsArray = [que1, que2, que3];
        
        Button (action: {
            questionsArray.forEach { item in
                print(item)}
            
        }) {
            Text("Questions")
        }
        
    }

    // finished scene
    func reportOutput() -> String {
        let per: Double = Double(correct);
        var res: String
        if (per == 100) {
            res = "Perfect!"
        } else if (per > 75) {
            res = "Almost!"
        } else if (per > 50) {
            res = "Good effort!"
        } else {
            res = "Yikes"
        }
        return res
    }
    
    var body: some View {

        
        Button(action: {
            print("submitted")
            loadQuestions()
        }) {
            Text("Welcome to Quiz View")
        }
        .padding(.bottom)
        .foregroundColor(.black)
        Spacer()
        
        Button(action: {
            NavigationLink(destination: Content()) {
                Text("BACK")
            }
        }) {
            Text("Back to Home")
        }
        .padding(.bottom)
        .foregroundColor(.blue)
        Spacer()
        
    }
}
