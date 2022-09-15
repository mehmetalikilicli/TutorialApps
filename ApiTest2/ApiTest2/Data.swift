

import Foundation
struct Data : Codable {
	let categoryId : String?
	let name : String?
	let icon : String?
	let orderIndex : Int?
	let createDate : String?
	let updateDate : String?
	let totalProducts : Int?
	let isActive : Bool?
	let subCategories : [String]?

	enum CodingKeys: String, CodingKey {

		case categoryId = "categoryId"
		case name = "name"
		case icon = "icon"
		case orderIndex = "orderIndex"
		case createDate = "createDate"
		case updateDate = "updateDate"
		case totalProducts = "totalProducts"
		case isActive = "isActive"
		case subCategories = "subCategories"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		categoryId = try values.decodeIfPresent(String.self, forKey: .categoryId)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		icon = try values.decodeIfPresent(String.self, forKey: .icon)
		orderIndex = try values.decodeIfPresent(Int.self, forKey: .orderIndex)
		createDate = try values.decodeIfPresent(String.self, forKey: .createDate)
		updateDate = try values.decodeIfPresent(String.self, forKey: .updateDate)
		totalProducts = try values.decodeIfPresent(Int.self, forKey: .totalProducts)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		subCategories = try values.decodeIfPresent([String].self, forKey: .subCategories)
	}

}
