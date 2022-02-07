import Foundation

struct GetMiniCardModel: Codable {
    var success: Bool
    var data: [MiniCard]
}

struct GetBigCardModel: Codable {
    var success: Bool
    var data: [BigCardModel]
}
