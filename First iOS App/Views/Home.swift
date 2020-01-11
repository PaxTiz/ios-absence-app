//
//  Home.swift
//  First iOS App
//
//  Created by Valentin Cernuta on 11/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import SwiftUI

struct Home: View {
	
	private var current: Int = 1
	
	init(semester: Int) {
		current = semester
		print("Init \(semester)")
	}
 
    var body: some View {
        Text("Semestre \(current)")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
		Home(semester: 1)
    }
}
