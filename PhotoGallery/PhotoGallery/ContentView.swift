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
    
    @State var openSheet = false
    @State var showAboutPage = false
    @State var showLicensePage = false
    let colums = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader{ geometry in
            
            ScrollView{
                LazyVGrid(columns: colums) {
                    ForEach(1...10, id: \.self) { i in
                        Color.init(uiColor: .random)
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
        .navigationBarItems(trailing: Button(action: { openSheet = true },
                                             label: { Image(systemName: "chevron.down") }))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $openSheet, content: {
            NavigationView {
                ZStack {
                    Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                    VStack(spacing: 30) {
                        Text("").padding(30)
                        
                        NavigationLink(destination: AboutView(), isActive: $showAboutPage) {
                            Button("About", action: { showAboutPage.toggle() } )
                                .font(.title)
                        }
                        
                        NavigationLink(destination: LicenseView(), isActive: $showLicensePage) {
                            Button("License", action: { showLicensePage.toggle() } )
                                .font(.title)
                        }
                        
                        Spacer()
                        
                        Text("App Version 0.1")
                            .padding()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    struct AboutView: View {
        var body: some View {
            VStack {
                Text("This is the about page. Insert some info here to show what this is about. App esplaiction, details, etc")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.top, 15)
                Spacer()
            }
            .navigationTitle("About Page")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    struct LicenseView: View {
        var body: some View {
            VStack {
                Text("Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n\n The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. \n\n THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.top, 15)
                Spacer()
            }
            .navigationTitle("License Page")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
