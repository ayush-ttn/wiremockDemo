//
//  Utility.swift
//  Wiremock Demo
//
//  Created by Piyush Bharadwaj on 15/03/24.
//

import Foundation

struct LaunchArguments {
  static var launchLocalArguments: [String] {
    return [
      "-runlocal"
    ]
  }
}

struct StartupUtils {
  static func shouldRunLocal() -> Bool {
    return CommandLine.arguments.contains("-runlocal")
  }
}

