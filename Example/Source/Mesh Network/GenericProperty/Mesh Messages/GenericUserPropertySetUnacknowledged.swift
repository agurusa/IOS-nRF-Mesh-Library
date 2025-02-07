
/*
* Copyright (c) 2019, Nordic Semiconductor
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* 1. Redistributions of source code must retain the above copyright notice, this
*    list of conditions and the following disclaimer.
*
* 2. Redistributions in binary form must reproduce the above copyright notice, this
*    list of conditions and the following disclaimer in the documentation and/or
*    other materials provided with the distribution.
*
* 3. Neither the name of the copyright holder nor the names of its contributors may
*    be used to endorse or promote products derived from this software without
*    specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
* NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
* WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
* ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
* POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import nRFMeshProvision

/*
 The Generic User Property Set Unacknowledged message, according to the Bluetooth SIG mesh specs are:
 User Property ID | 2 octets | Property ID identifying a Generic User Property
 User Property Value | variable size | Raw value for the User Property
 Opcode 0x4D
 */


public struct GenericUserPropertySetUnacknowledged: GenericMessage {
    
    public static var opCode: UInt32 = 0x4D
    public var parameters: Data? {
        var propIDMutable = propertyID
        let data = Data(bytes: &propIDMutable, count: MemoryLayout<UInt16>.size)
        let propIdUint8 = [UInt8](data)
//        let propValueUint8: [UInt8] = [UInt8(propertyValue)]
//        return Data(propIdUint8 + propValueUint8)
        return Data(propIdUint8 + propertyValue)
    }
    
    /// The state.
    public let propertyID: UInt16
    public let propertyValue: [UInt8]
    
    init(propertyID: UInt16, propertyValue: [UInt8]) {
        self.propertyID = propertyID
        self.propertyValue = propertyValue
    }
    
    public init?(parameters: Data) {
        //todo: this isn't working properly. parse the received message appropriately.
        propertyID = UInt16(parameters[0])
        propertyValue = [UInt8](arrayLiteral: parameters[1])
    }
    
}
