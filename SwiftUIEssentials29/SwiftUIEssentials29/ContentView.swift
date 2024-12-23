//
//  ContentView.swift
//  SwiftUIEssentials29
//
//  Created by beqa on 09.12.24.
//


import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Image("Cutiee")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                    .shadow(radius: 5)
                
                Text("John Doe")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("iOS Developer | Swift Enthusiast | Tech Lover")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.top, 40)
            
            Divider()
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Work Experience")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 25)
                
                
                LazyVStack(alignment: .leading, spacing: 10) {
                    WorkExperienceView(company: "HDR Solutions Inc.", role: "iOS Developer", duration: "2021 - Present")
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Add New Working Experience:")
                        .font(.headline)
                    
                    TextField("Enter Company Name", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Enter Role", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Enter Duration", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                    }) {
                        Text("Add Experience")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 59/255, green: 119/255, blue: 91/255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                }
                .padding()
                .background(Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 0.53))
                .cornerRadius(10)
                .frame(width: 351, alignment: .leading)
                
            }
            .padding(.horizontal, 20)
            Spacer()
            Spacer()
        }
    }
}

struct WorkExperienceView: View {
    var company: String
    var role: String
    var duration: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(company)
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(role)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(duration)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        
        .padding()
        .frame(width: 351, alignment: .leading)
        .background(Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 0.53))
        .cornerRadius(10)

    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

