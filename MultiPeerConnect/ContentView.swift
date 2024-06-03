//
//  ContentView.swift
//  MultiPeerConnect
//
//  Created by Heical Chandra on 03/06/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mpcManager = MultipeerConnectivityManager()
    @State private var messageToSend = ""
    
    var body: some View {
        VStack {
            List(mpcManager.receivedMessages, id: \.self) { message in
                Text(message)
            }
            
            HStack {
                TextField("Type your message", text: $messageToSend)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if !messageToSend.isEmpty {
                        mpcManager.send(message: messageToSend)
                        mpcManager.receivedMessages.append("Me: \(messageToSend)")
                        messageToSend = ""
                    }
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}



#Preview {
    ContentView()
}
