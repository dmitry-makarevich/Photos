//
//  MainViewModelTests.swift
//  PhotosTests
//
//  Created by Dzmitry Makarevich on 10/14/21.
//

import XCTest
@testable import Photos

class MainViewModelTests: XCTestCase {
    var webservice: MockWebservice!
    var viewModel: MainViewModel!

    override func setUpWithError() throws {
        webservice = MockWebservice()
        viewModel = MainViewModel(coordinator: MainCoordinator(), webservice: webservice)
    }

    override func tearDownWithError() throws {
        webservice = nil
        viewModel = nil
    }

    func testLoadPhotos_ShouldBeNotEmpty() throws {
        // Arrange
        let expectation = XCTestExpectation()
        let photos = webservice.photos
        var receivePhotos = [Photo]()
        webservice.isError = false
        
        // Act
        viewModel.loadPhotos { result in
            receivePhotos = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
        
        // Assert
        XCTAssertEqual(photos.count, receivePhotos.count)
    }

    func testLoadPhotos_WithSomeError_ShouldBeEmpty() throws {
        // Arrange
        let expectation = XCTestExpectation()
        let emptyPhotos = [Photo]()
        var receivePhotos = [Photo]()
        webservice.isError = true
        
        // Act
        viewModel.loadPhotos { result in
            receivePhotos = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
        
        // Assert
        XCTAssertEqual(emptyPhotos.count, receivePhotos.count)
    }
}
