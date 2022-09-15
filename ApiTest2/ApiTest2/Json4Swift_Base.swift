

import Foundation
struct Json4Swift_Base : Codable {
	let success : Bool?
	let data : [Data]?

	enum CodingKeys: String, CodingKey {

		case success = "success"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		success = try values.decodeIfPresent(Bool.self, forKey: .success)
		data = try values.decodeIfPresent([Data].self, forKey: .data)
	}

}
