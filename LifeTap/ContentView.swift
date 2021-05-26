//
//  ContentView.swift
//  LifeTap
//
//  Created by sabaz shereef on 26/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home: View {
    @State var show = false
    @State var imageData = [
        
        Post(id: 0, loading: false, seen: false, profilePic: "pro1"),
        Post(id: 1, loading: false, seen: false, profilePic: "pro2"),
        Post(id: 2, loading: false, seen: false, profilePic: "pro3"),
        Post(id: 3, loading: false, seen: false, profilePic: "pro4"),
        Post(id: 4, loading: false, seen: false, profilePic: "pro5"),
        Post(id: 5, loading: false, seen: false, profilePic: "pro6"),
        Post(id: 6, loading: false, seen: false, profilePic: "pro7"),
        Post(id: 7, loading: false, seen: false, profilePic: "pro8"),
        Post(id: 8, loading: false, seen: false, profilePic: "pro9"),
        Post(id: 9, loading: false, seen: false, profilePic: "pro10")
    ]
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 22){
                        
                        ForEach(0..<self.imageData.count){ i in
                            
                            
                            ZStack(alignment: .bottomTrailing){
                                
                                
                                Image(self.imageData[i].profilePic)
                                    .resizable()
                                    .frame(width: 65, height: 65)
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                                
                                if !self.imageData[i].seen {
                                    Circle()
                                        
                                        .stroke(AngularGradient(gradient: .init(colors: [.red, .orange,.green]),center: .center),style: StrokeStyle(lineWidth: 4,dash: [ 0]))
                                        .frame(width: 65 , height: 65)
                                        
                                        .rotationEffect(.init(degrees: self.imageData[i].loading  ? 360 : 0))
                                }
                                
                            }
                                                    
                            .frame(width: 65)
                            .onTapGesture {
                                withAnimation(Animation.default.speed(0.35).repeatForever(autoreverses: false)){
                                    
                                    self.imageData[i].loading.toggle()
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        self.imageData[i].seen.toggle()
                                    }
                                }
                            }
                            
                        }
                    }
                    
                    .padding()
                }
                
                Spacer()
                
            }
            Divider()
        }
        .navigationBarTitle("Instagram")
    }
    
}
struct Post : Identifiable {
    var id: Int
    var loading : Bool
    var seen: Bool
    var profilePic : String
    
}
