//
//  OnBoardingView.swift
//  PhotoGallery
//
//  Created by Veer Singh on 8/11/22.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var onBoardingDismissed:Bool = false
    @State private var selectedNumber = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("AdaptiveBackground")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("Welcome to ColorsGallery")
                        .foregroundColor(Color("AdaptiveText"))
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 1)
                    
                    Text("Made by Veer Singh")
                        .foregroundColor(Color("AdaptiveText"))
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 35)
                    
                    NumberSelector
                    
                    NavigationLink(destination: HomeView(selectedNumber: selectedNumber), isActive: $onBoardingDismissed){
                        Button(action:{
                            onBoardingDismissed = true
                        }){
                            Image(systemName: "chevron.right")
                                .font(.largeTitle)
                                .foregroundColor(buttonColor)
                                .padding(.top, 80)
                        }.disabled(noNumberSelected)
                    }.disabled(noNumberSelected)
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
    
}
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

extension OnBoardingView {
    var NumberSelector: some View {
        HStack {
            Text("Number of Colors:")
            Picker("", selection: $selectedNumber) {
                Text("No Selection").tag(0)
                ForEach(1...100, id: \.self) {
                    Text("\($0)")
                }
            }
        }
    }
    
    var noNumberSelected: Bool {
        if selectedNumber <= 0{
            return true
        } else { return false }
    }
    
    var buttonColor: Color {
        return noNumberSelected ? .gray : .blue
    }
}
