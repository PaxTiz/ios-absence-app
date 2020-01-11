//
//  ContentView.swift
//  First iOS App
//
//  Created by Valentin Cernuta on 11/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var selection = 1
	private let semesters: [Int] = [
		1, 2, 3, 4
	]
	
	var body: some View {
		
		NavigationView {
			TabView(selection: $selection) {
				
				ForEach(semesters, id: \.self) { sm in
					Home(semester: sm).tabItem {
						Image(systemName: "\(sm).circle")
						Text("Semestre \(sm)")
					}.tag(sm - 1)
				}
				
			}.navigationBarTitle("Semestre \(selection)")
				.navigationBarItems(trailing:
					Button(action: {
						// TODO : Affcher une action sheet pour ajouter une matière dans le semestre courant
					}) {
						Image(systemName: "plus").foregroundColor(Color.blue)
						Text("Ajouter une matière")
					}
			)
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
