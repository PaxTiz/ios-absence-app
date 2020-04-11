//
//  Material.swift
//  First iOS App
//
//  Created by Valentin Cernuta on 12/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import Foundation

struct Material : Hashable {
	
	var name: String
	var totalHours: Int
	var absences: Int = 2
	var ue: UE
	
	init(name: String, totalHours: Int, ue: UE) {
		self.name = name
		self.totalHours = totalHours
		self.ue = ue
	}
	
}
