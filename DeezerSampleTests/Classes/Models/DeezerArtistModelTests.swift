//
//  DeezerArtistModelTests.swift
//  DeezerSampleTests
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import XCTest
@testable import DeezerSample

class DeezerArtistModelTests: XCTestCase {
    
  /*******************************************************************************/
  // MARK: - Tests
  
  /**
   *
   */
  func test_init_nilWhenEmptyJson() {
    // Given
    let json: [String: Any] = [:]
    
    // When
    let result: DeezerArtistModel? = DeezerArtistModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
  
  /**
   *
   */
  func test_init_artistModelWhenJsonConstainsAllMandatoryData() {
    // Given
    let expectedId: Int = 2
    let expectedName: String = "ArtistName"
    let json: [String: Any] = [
      "id":2,
      "name":"ArtistName"
    ]
    
    // When
    let result: DeezerArtistModel? = DeezerArtistModel(json: json)
    
    // Then
    XCTAssertNotNil(result)
    let artist = result!
    XCTAssertTrue((artist.identifier == expectedId), "Result: \(artist.identifier) | ExpectedResult: \(expectedId)")
    XCTAssertTrue((artist.name == expectedName), "Result: \(artist.name) | ExpectedResult: \(expectedName)")
  }
  
  /**
   *
   */
  func test_init_nilWhenJsonConstainsAllDataAndMissingId() {
    // Given
    let json: [String: Any] = [
      "name":"ArtistName"
    ]
    
    // When
    let result: DeezerArtistModel? = DeezerArtistModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
  
  /**
   *
   */
  func test_init_nilWhenJsonConstainsAllDataAndMissingName() {
    // Given
    let json: [String: Any] = [
      "id":2,
    ]
    
    // When
    let result: DeezerArtistModel? = DeezerArtistModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
}
