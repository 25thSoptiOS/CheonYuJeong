

import Foundation
// MARK: - Welcome
struct Welcome: Codable {
    let greeting: String
    let instructions: [Instruction]
}

// MARK: - Instruction
struct Instruction: Codable {
    let success: Bool
    let message: String
    let data: Int
}
