//
//  HomeView.swift
//  PhotoGallery
//
//  Created by Veer Singh on 8/11/22.
//
import SwiftUI

struct HomeView: View {
    
    @State var openSheet = false
    @State var showAboutPage = false
    @State var showLicensePage = false
    @State var selectedNumber: Int
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Color("AdaptiveBackground")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    LazyVGrid(columns: columns) {
                        ForEach(1...selectedNumber, id: \.self) { _ in
                            Color.init(uiColor: .random)
                                .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                                .onTapGesture {
                                    
                                }
                        }
                    }
                    
                    HStack{
                        VStack{
                            Text("Made by Veer Singh")
                                .foregroundColor(Color("AdaptiveText"))
                                .font(.caption)
                                .padding()
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Menu(content: {
                    NumberSelector
                }, label: {Image(systemName: "slider.horizontal.3")})
            }
        }
        .navigationBarItems(trailing: Button(action: { openSheet = true },
                                             label: { Image(systemName: "info.circle") }))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $openSheet, content: {
            NavigationView {
                ZStack {
                    Color("AdaptiveBackground")
                        .opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
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
                        
                        Text("App Version 1.0")
                            .foregroundColor(Color("AdaptiveText"))
                            .padding()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        })
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedNumber: 10)
    }
}


extension HomeView {
    var NumberSelector: some View {
        HStack {
            Text("Select a number of colors")
            Picker("", selection: $selectedNumber) {
                ForEach(1...100, id: \.self) {
                    Text("\($0)")
                }
            }
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
    
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
