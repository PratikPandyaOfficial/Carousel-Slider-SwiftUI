//
//  CarouselSliderView.swift
//  Carousel-Slider-SwiftUI
//
//  Created by Drashti on 04/08/23.
//

import SwiftUI

struct CarouselSliderView: View {
    @State var imageUrls = [URL]()
    @State private var currentIndex = 0

    var body: some View {
        HStack {
            Button {
                if currentIndex >= 1 {
                    withAnimation { currentIndex -= 1 }
                }
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
            
            let _ = print("imageUrls count is ",imageUrls.count)
            TabView(selection: $currentIndex) {
                ForEach(0..<imageUrls.count, id: \.self) { index in
                    CarouselSliderItemView(imageURL: imageUrls[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Button {
                if currentIndex < imageUrls.count - 1 {
                    withAnimation { currentIndex += 1 }
                }
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
            .onAppear {
                 //Loop through the carousel infinitely by adjusting the currentIndex accordingly.
                 //Note that this example assumes you have at least one image.
                let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                    withAnimation {
                        currentIndex = (currentIndex + 1) % imageUrls.count
                    }
                }
                 //Make sure to invalidate the timer when the view disappears.
                 //This prevents the timer from continuing after the view is removed from the screen.
                RunLoop.current.add(timer, forMode: .common)
            }
            
        }
        .padding()
        .frame(width: .infinity, height: 200.0)
        .background(.gray)
    }
}
struct CarouselSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselSliderView(imageUrls: [URL]())
    }
}
