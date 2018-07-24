//
//  DeezerTrackModelTests.swift
//  DeezerSampleTests
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import XCTest
@testable import DeezerSample

class DeezerTrackModelTests: XCTestCase {
    
  /*******************************************************************************/
  // MARK: - Tests
  
  /**
   *
   */
  func test_init_nilWhenEmptyJson() {
    // Given
    let json: [String: Any] = [:]
    
    // When
    let result: DeezerTrackModel? = DeezerTrackModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
  
  /**
   *
   */
  func test_init_trackModelWhenJsonConstainsAllMandatoryData() {
    // Given
    let expectedId: Int = 1
    let expectedTitle: String = "TrackTitle"
    let expectedDuration: TimeInterval = 3600.0
    let json: [String: Any] = [
      "id":1,
      "title":"TrackTitle",
      "duration":3600.0,
      "preview":"http://www.google.com/image",
      "artist":[
        "id":2,
        "name":"ArtistName"
      ]
    ]
    
    // When
    let result: DeezerTrackModel? = DeezerTrackModel(json: json)
    
    // Then
    XCTAssertNotNil(result)
    let track = result!
    XCTAssertTrue((track.identifier == expectedId), "Result: \(track.identifier) | ExpectedResult: \(expectedId)")
    XCTAssertTrue((track.title == expectedTitle), "Result: \(track.title) | ExpectedResult: \(expectedTitle)")
    XCTAssertTrue((track.duration == expectedDuration), "Result: \(track.duration) | ExpectedResult: \(expectedDuration)")
  }
  
  /**
   *
   */
  func test_init_nilWhenJsonConstainsAllDataAndMissingName() {
    // Given
    let json: [String: Any] = [
      "id":1,
      "duration":3600.0,
      "preview":"http://www.google.com/image",
      "artist":[
        "id":2,
        "name":"ArtistName"
      ]
    ]
    
    // When
    let result: DeezerTrackModel? = DeezerTrackModel(json: json)
    
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
      "preview":"http://www.google.com/image",
      "artist":[
        "id":2,
        "name":"ArtistName"
      ]
    ]
    
    // When
    let result: DeezerTrackModel? = DeezerTrackModel(json: json)
    
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
      "preview":"http://www.google.com/image",
      "artist":[
        "id":2,
        "name":"ArtistName"
      ]
    ]
    
    // When
    let result: DeezerTrackModel? = DeezerTrackModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
  
  /**
   *
   */
  func test_init_nilWhenJsonConstainsAllDataAndMissingArtist() {
    // Given
    let json: [String: Any] = [
      "id":1,
      "title":"TrackTitle",
      "duration":3600.0,
      "preview":"http://www.google.com/image",
    ]
    
    // When
    let result: DeezerTrackModel? = DeezerTrackModel(json: json)
    
    // Then
    XCTAssertNil(result)
  }
}
