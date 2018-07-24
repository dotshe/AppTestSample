//
//  DeezerPlaylistModelTests.swift
//  DeezerSampleTests
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import XCTest
@testable import DeezerSample

class DeezerPlaylistModelTests: XCTestCase {
  
  /*******************************************************************************/
  // MARK: - Tests
  
  /**
   *
   */
  func test_init_nilWhenEmptyJson() {
    // Given
    let json: [String: Any] = [:]
    
    // When
    let result: DeezerPlaylistModel? = DeezerPlaylistModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
  
  /**
   *
   */
  func test_init_playlistModelWhenJsonConstainsAllMandatoryData() {
    // Given
    let expectedId: Int = 1
    let expectedTitle: String = "TrackTitle"
    let expectedDuration: TimeInterval = 3600.0
    let json: [String: Any] = [
      "id":1,
      "title":"TrackTitle",
      "duration":3600.0
    ]
    
    // When
    let result: DeezerPlaylistModel? = DeezerPlaylistModel(json: json)
    
    // Then
    XCTAssertNotNil(result)
    let playlist = result!
    XCTAssertTrue((playlist.identifier == expectedId), "Result: \(playlist.identifier) | ExpectedResult: \(expectedId)")
    XCTAssertTrue((playlist.title == expectedTitle), "Result: \(playlist.title) | ExpectedResult: \(expectedTitle)")
    XCTAssertTrue((playlist.duration == expectedDuration), "Result: \(playlist.duration) | ExpectedResult: \(expectedDuration)")
  }
  
  /**
   *
   */
  func test_init_nilWhenJsonConstainsAllDataAndMissingName() {
    // Given
    let json: [String: Any] = [
      "id":1,
      "duration":3600.0,
    ]
    
    // When
    let result: DeezerPlaylistModel? = DeezerPlaylistModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
  
  /**
   *
   */
  func test_init_nilWhenJsonConstainsAllDataAndMissingDuration() {
    // Given
    let json: [String: Any] = [
      "id":1,
      "title":"TrackTitle",
    ]
    
    // When
    let result: DeezerPlaylistModel? = DeezerPlaylistModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
  
  /**
   *
   */
  func test_init_nilWhenJsonConstainsAllDataAndMissingId() {
    // Given
    let json: [String: Any] = [
      "title":"TrackTitle",
      "duration":3600.0,
    ]
    
    // When
    let result: DeezerPlaylistModel? = DeezerPlaylistModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
}
