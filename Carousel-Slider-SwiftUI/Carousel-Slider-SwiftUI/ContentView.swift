//
//  ContentView.swift
//  Carousel-Slider-SwiftUI
//
//  Created by Drashti on 04/08/23.
//

import SwiftUI

struct ContentView: View {
    let imageUrls: [URL] = [
            URL(string: "https://1.bp.blogspot.com/-kK7Fxm7U9o0/YN0bSIwSLvI/AAAAAAAACFk/aF4EI7XU_ashruTzTIpifBfNzb4thUivACLcBGAsYHQ/s1280/222.jpg")!,
            URL(string: "https://media.istockphoto.com/id/1283852667/photo/touch-of-fresh-moss-in-the-forest.jpg?s=2048x2048&w=is&k=20&c=0GQnyGr_AiQreuQSEamiqsoUhYlYLh94fO1fv1d2diA=")!,
            // Add more image URLs as needed
        ]

        var body: some View {
            VStack {
                Text("Carousel Slider Example")
                    .font(.title)
                CarouselSliderView(imageUrls: imageUrls)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
