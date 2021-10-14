//
//  StoryboardsTests.swift
//  PhotosTests
//
//  Created by Dzmitry Makarevich on 10/14/21.
//

import XCTest
@testable import Photos

class StoryboardsTests: XCTestCase {
    
    func testOLWelcomeViewController_ShouldBeInitialized() {
        let vc = MainViewController.instantiate()
        XCTAssertNotNil(vc)
    }

    func testOLAuthViewController_ShouldBeInitialized() {
        let vc = MainViewController.instantiate()
        XCTAssertNotNil(vc)
    }
}
