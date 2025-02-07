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

public struct GenericUserPropertyStatus: GenericMessage {

    public static var opCode: UInt32 = 0x4E
    
    public var parameters: Data? {
        let propIdUint8:[UInt8] = [UInt8(propertyID & 0xFF), UInt8(propertyID >> 8)]
        return Data(propIdUint8 + [userAccess] + [targetValue])
    }
    
    /// Property ID identifying a Generic User Property.
    public let propertyID: UInt16
    /// Enumeration indicating user access
    public let userAccess: UInt8
    /// Raw value for the User Property
    public let targetValue: UInt8
    
    
    /// Creates the Generic OnOff Status message.
    ///
    /// - parameters:
    ///   - propertyID: Property ID identifying a Generic User Property.
    /// - UserAccess: Enumeration indicating user access
    /// - targetValue: Raw value for the User Property
    public init(propertyID: UInt16, userAccess: UInt8, targetValue: UInt8) {
        self.propertyID = propertyID
        self.userAccess = userAccess
        self.targetValue = targetValue
    }
    
    public init?(parameters: Data) {
        guard parameters.count == 3 else {
            return nil
        }
        propertyID = UInt16(parameters[0])
        userAccess = parameters[1]
        targetValue = parameters[2]
    }    
}
