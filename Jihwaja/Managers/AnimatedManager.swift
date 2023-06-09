//
//  AnimatedManager.swift
//  Jihwaja
//
//  Created by geee3 on 2023/05/12.
//

import SwiftUI
import FLAnimatedImage

struct AnimatedManager: UIViewRepresentable {
    let animatedView = FLAnimatedImageView()
    var fileName: String
    
    func makeUIView(context: UIViewRepresentableContext<AnimatedManager>) -> UIView {
        let view = UIView()
        
        let path: String = Bundle.main.path(forResource: fileName, ofType: "gif")!
        let url = URL(fileURLWithPath: path)
        let gifData = try! Data(contentsOf: url)
        
        let gif = FLAnimatedImage(animatedGIFData: gifData)
        animatedView.animatedImage = gif
        
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)
        
        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimatedManager>) {}
}
