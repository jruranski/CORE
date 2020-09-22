//
//  MapSelection.swift
//  CORE
//
//  Created by Jakub Ruranski on 10/09/2020.
//

import SwiftUI
import MapKit
import UIKit
struct MapSelection<Wrapper : UIView>: UIViewRepresentable {
    typealias Updater = (Wrapper, Context) -> Void

    var makeView: () -> Wrapper
    var update: (Wrapper, Context) -> Void

    init(_ makeView: @escaping @autoclosure () -> Wrapper,
         updater update: @escaping (Wrapper) -> Void) {
        self.makeView = makeView
        self.update = { view, _ in update(view) }
    }

    func makeUIView(context: Context) -> Wrapper {
        makeView()
    }

    func updateUIView(_ view: Wrapper, context: Context) {
        update(view, context)
    }
}




