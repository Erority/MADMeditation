import Foundation

struct MiniCard: Codable, Identifiable{
    var id: Int
    var title: String
    var position: Int
    var image: String
}
