//
//  DetailViewModelTests.swift
//  PhotosTests
//
//  Created by Dzmitry Makarevich on 10/14/21.
//

import XCTest
@testable import Photos

class DetailViewModelTests: XCTestCase {
    var webservice: MockWebservice!
    var viewModel: DetailViewModel!
    var photoId: Int!

    override func setUpWithError() throws {
        photoId = 1
        webservice = MockWebservice()
        viewModel = DetailViewModel(photoId: photoId,
                                    coordinator: MainCoordinator(),
                                    webservice: webservice)
    }

    override func tearDownWithError() throws {
        photoId = nil
        webservice = nil
        viewModel = nil
    }

    func testLoadDetailPhoto_ShouldBeNotEmpty() throws {
        // Arrange
        let expectation = XCTestExpectation()
        var receivePhoto: Photo? = nil
        webservice.isError = false
        
        // Act
        viewModel.loadPhoto { result in
            receivePhoto = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
        
        // Assert
        XCTAssertNotNil(receivePhoto)
    }
    
    func testLoadDetailPhoto_ShouldBeEmpty() throws {
        // Arrange
        let expectation = XCTestExpectation()
        var receivePhoto: Photo? = webservice.photos[1]
        webservice.isError = true
        
        // Act
        viewModel.loadPhoto { result in
            receivePhoto = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
        
        // Assert
        XCTAssertNil(receivePhoto)
    }
}
