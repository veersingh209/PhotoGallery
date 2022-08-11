//
//  OnBoardingView.swift
//  PhotoGallery
//
//  Created by Veer Singh on 8/11/22.
//

import SwiftUI

struct OnBoardingView: View {
    @State var onBoardingDismissed:Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("Welcome to the GalleryApp")
                        .foregroundColor(.white)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 1)
                    
                    Text("Made by Veer Singh")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: ContentView(), isActive: $onBoardingDismissed){
                        Button(action:{
                            onBoardingDismissed = true
                        }){
                            Image(systemName: "chevron.right")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(.top, 80)
                        }
                    }
                    
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
