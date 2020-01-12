//
//  Home.swift
//  First iOS App
//
//  Created by Valentin Cernuta on 11/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct Home: View {
	
	private var current: Semester
	
	init(semester: Semester) {
		current = semester
		print("Init \(semester)")
	}
 
    var body: some View {
		List {
			Section {
				ForEach(current.materials, id: \.self) { ma in
					Text(ma.name)
				}
			}
			}.listStyle(GroupedListStyle())
	
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
		Home(semester: Semester(id: 1, materials: [
			Material(name: "SE", totalHours: 45),
			Material(name: "PWEB", totalHours: 60),
			Material(name: "Anglais", totalHours: 45),
		]))
    }
}
