//
//  LAContext+Extension.swift
//  FaceLock
//
//  Created by Harjot Bharti on 7/9/24.
//

import LocalAuthentication

extension LAContext {
    enum BiometricType: String {
        case none
        case touchID
        case faceID
        case opticID
    }

    var biometricType: BiometricType {
        var error: NSError?

        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }

        if #available(iOS 11.0, *) {
            switch self.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            default:
                if #available(iOS 17.0, *) {
                    if self.biometryType == .opticID {
                        return .opticID
                    } else {
                        return .none
                    }
                }
            }
        }

        return  self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
    }
}

