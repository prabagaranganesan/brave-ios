// Copyright 2021 The Brave Authors. All rights reserved.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import UIKit
import CarPlay
import Shared

private let log = Logger.browserLogger

class CarplayTemplateApplicationSceneDelegate: NSObject {
    private static let configurationName = "CPTemplateSceneConfiguration"
    
    // MARK: UISceneDelegate
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if scene is CPTemplateApplicationScene,
            session.configuration.name == CarplayTemplateApplicationSceneDelegate.configurationName {
            log.debug("Template application scene will connect.")
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        if scene.session.configuration.name == CarplayTemplateApplicationSceneDelegate.configurationName {
            log.debug("Template application scene did disconnect.")
        }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        if scene.session.configuration.name == CarplayTemplateApplicationSceneDelegate.configurationName {
            log.debug("Template application scene did become active.")
        }
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        if scene.session.configuration.name == CarplayTemplateApplicationSceneDelegate.configurationName {
            log.debug("Template application scene will resign active.")
        }
    }
}

// MARK: CPTemplateApplicationSceneDelegate

extension CarplayTemplateApplicationSceneDelegate: CPTemplateApplicationSceneDelegate {
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didConnect interfaceController: CPInterfaceController) {
        log.debug("Template application scene did connect.")
        
        PlaylistCarplayManager.shared.connect(interfaceController: interfaceController)
    }
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                  didDisconnectInterfaceController interfaceController: CPInterfaceController) {
        log.debug("Template application scene did disconnect.")
        
        PlaylistCarplayManager.shared.disconnect(interfaceController: interfaceController)
    }
}
