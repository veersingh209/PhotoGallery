//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Veer Singh on 8/11/22.
//
import SwiftUI

struct ContentView: View {
    
    init() {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = .dark
    }
    
    let colums = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader{ geometry in
            
            ScrollView{
                LazyVGrid(columns: colums) {
                    ForEach(1...10, id: \.self) { i in
                        Color.gray
                            .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                    }
                }
                
                HStack{
                    VStack{
                        Text("Made by Veer Singh")
                            .foregroundColor(.white)
                            .font(.caption)
                            .padding()
                    }
                }
            }
        }

        .navigationBarHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
