//
//  GroupClientCell.swift
//  nRF Mesh
//
//  Created by Aarthi Gurusami on 6/27/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import nRFMeshProvision

class GroupClientCell: BaseModelControlCell<GenericPropertyClientDelegate> {
    override func setup(_ model: GenericPropertyClientDelegate?){
        let localProvisioner = MeshNetworkManager.instance.meshNetwork?.localProvisioner
        let isEnabled = localProvisioner?.hasConfigurationCapabilities ?? false
    }
}
