
import Foundation
import nRFMeshProvision

class GenericUserPropertyServerDelegate: ModelDelegate {
    
    var publicationMessageComposer: MessageComposer? {
        func compose() -> MeshMessage {
            return GenericUserPropertyStatus(propertyID: 0x1111, userAccess:0x03, targetValue: 1)
        }
        let request = compose()
        return {
            return request
        }
    }
    
    let messageTypes: [UInt32 : MeshMessage.Type]
    let isSubscriptionSupported: Bool = true
    
    init(_ meshNetwork: MeshNetwork) {
        let types: [GenericMessage.Type] = [
            GenericUserPropertySetUnacknowledged.self,
            GenericUserPropertyGet.self
        ]
        messageTypes = types.toMap()
        

    }
    
    
    // MARK: - Message handlers
    
    func model(_ model: nRFMeshProvision.Model, didReceiveUnacknowledgedMessage message: nRFMeshProvision.MeshMessage, from source: nRFMeshProvision.Address, sentTo destination: nRFMeshProvision.MeshAddress) {
        print("i received an unacknowledged message")
        
    }
    
    func model(_ model: nRFMeshProvision.Model, didReceiveResponse response: nRFMeshProvision.MeshMessage, toAcknowledgedMessage request: nRFMeshProvision.AcknowledgedMeshMessage, from source: nRFMeshProvision.Address) {
        //don't care about this rn
    }
    
    func model(_ model: nRFMeshProvision.Model, didReceiveAcknowledgedMessage request: nRFMeshProvision.AcknowledgedMeshMessage, from source: nRFMeshProvision.Address, sentTo destination: nRFMeshProvision.MeshAddress) throws -> nRFMeshProvision.MeshMessage {
        //don't care about this rn
        fatalError("What has just happened?")
    }
    var state = GenericUserPropertyStatus(propertyID: 0x1111, userAccess: 0x03, targetValue: 0x01)
    private var observer: ((GenericUserPropertyStatus) -> ())?
    
    /// Sets a model state observer.
    ///
    /// - parameter observer: The observer that will be informed about
    ///                       state changes.
    func observe(_ observer: @escaping (GenericUserPropertyStatus) -> ()) {
        self.observer = observer
        observer(state)
    }
}
