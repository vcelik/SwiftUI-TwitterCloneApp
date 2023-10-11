//
//  LoginView.swift
//  TwitterApp
//
//  Created by Volkan Celik on 20/07/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email=""
    @State var password=""
    
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Image("twitter-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width:220,height:110)
                        .padding(.top,88)
                        .padding(.bottom,32)
                    
                    VStack(){
                        CustomTextField(text: $email, placeholder: "Email",imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.vertical)
                            .foregroundColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: "Password")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.vertical)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal,32)
                    
                    HStack{
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top,16)
                                .padding(.trailing,32)
                        }

                    }
                    
                    Button {
                        viewModel.login(withEmail: email, password: password)
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width:360,height:50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView().navigationBarBackButtonHidden(true)
                    } label: {
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14,weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom,40)
                    }

                    


                    
                }
            }
            .background(Color(#colorLiteral(red: 0.1825715601, green: 0.6299551129, blue: 0.9542170167, alpha: 1)))
        .ignoresSafeArea()
        }
    }
}


