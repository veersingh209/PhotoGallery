//
//  AboutView.swift
//  PhotoGallery
//
//  Created by Veer Singh on 8/15/22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Simple app to view random colors based on user's input for the number of colors desired. \n\n Colors are randomly generated using Apple's built-in Swift random(in range: ClosedRange<Self>) method with values ranging from 0 to 1. ")
                .font(.body)
                .foregroundColor(Color("AdaptiveText"))
                .padding(.top, 15)
                .padding()
            Spacer()
        }
        .navigationTitle("About Page")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
