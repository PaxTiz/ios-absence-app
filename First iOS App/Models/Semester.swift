//
//  Semester.swift
//  First iOS App
//
//  Created by Valentin Cernuta on 12/01/2020.
//  Copyright © 2020 Valentin Cernuta. All rights reserved.
//

import Foundation

struct Semester : Hashable {
	var identifier: Int
	var materials: [Material]
	
	init(id: Int, materials: [Material]) {
		self.identifier = id
		self.materials = materials
	}
}
