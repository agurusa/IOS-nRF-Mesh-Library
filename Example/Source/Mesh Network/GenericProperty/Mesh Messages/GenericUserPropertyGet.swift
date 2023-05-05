import Foundation
import nRFMeshProvision

public struct GenericUserPropertyGet: GenericMessage {
    public static var opCode: UInt32 = 0x822F
    public var parameters: Data? {
        var propIDMutable = propertyID
        let data = Data(bytes: &propIDMutable, count: MemoryLayout<UInt16>.size)
        let propIdUint8 = [UInt8](data)
        return Data(propIdUint8)
    }
    
    /// The state.
    public let propertyID: UInt16
    
    init(propertyID: UInt16) {
        self.propertyID = propertyID
    }
    
    public init?(parameters: Data) {
        propertyID = UInt16(parameters[0])
    }
}
