//
//  ContentView.swift
//  SignIn
//
//  Created by Students on 16.12.2022.
//

import SwiftUI

struct SignInView: View {
    
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView{
            VStack {
                
                Logo()
                    .padding(.top, 30)
                
                
                VStack(alignment: .leading, spacing: 2) {
                        SignInRow(textField: "Enter you name here", imageName: "person", binding: $userName)
                        SignInRow(textField: "Enter you email here", imageName: "envelope", binding: $email)
                            // delete capitalize first leter and other features
                        SignInRow(textField: "Enter you password here", imageName: "key", binding: $password)
                    }
                .padding(.top, 20)
                
                Spacer()
                
                SignInButton()
                
                NavigationLink("Link", destination: WelcomeView())
               
                Spacer()
            }
            .navigationTitle("Sign In")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Logo : View {
    var body: some View {
        Image(systemName: "rectangle.and.pencil.and.ellipsis")
            .resizable()
            .scaledToFit()
            .frame(width: 100,  height: 100)
            .foregroundColor(.accentColor)
    }
}

struct SignInRow : View {
    
    var textField = ""
    var imageName = ""
    
    var binding: Binding<String>
        
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
                .foregroundColor(.accentColor)
                .padding()
                .background(Color(uiColor: .systemGray6))
                    .clipShape(Circle())
            
            
            if imageName == "key" {
                SecureField(textField, text: binding)
                    .padding()
                    .background(Color(uiColor: .systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
            } else {
                TextField(textField, text: binding)
                    .padding()
                    .background(Color(uiColor: .systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
        }.padding(.leading)
    }
}


struct SignInButton : View {
    
    var body: some View {
        Button {
           //NavigationLink("", destination: WelcomeView())
        } label: {
            Text("Sign UP")
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                
//            Label("Sign UP", systemImage: "checkmark.circle")
               
                
        }
        .padding(.horizontal)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            
    }
}
