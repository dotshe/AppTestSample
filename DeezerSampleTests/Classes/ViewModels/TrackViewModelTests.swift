//
//  TrackViewModelTests.swift
//  DeezerSampleTests
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import XCTest
@testable import DeezerSample

class TrackViewModelTests: XCTestCase {
  
  /*******************************************************************************/
  // MARK: - SetUp/TearDown
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  /*******************************************************************************/
  // MARK: - Tests
  
  /**
   *
   */
  func test_initWithTrack_propertiesAreSettedWhenMethodCalledWithTrack() {
    // Given
    let expectedTitle: String = "TrackTitle1"
    let expectedArtistIdentifier: Int = 2
    let expectedDuration: TimeInterval = 3600.0
    let track = DeezerTrackModel(json: [
      "id":1,
      "title":"TrackTitle1",
      "duration":3600.0,
      "preview":"http://www.google.com/images",
      "artist":[
        "id":2,
        "name":"ArtistName1"
      ],
      ])!
    
    // When
    let result = TrackViewModel(withTrack: track)
    let titleResult: String = result.title.value!
    let artistResult: ArtistModel = result.artist.value!
    let durationResult: TimeInterval = result.duration.value!
    
    // Then
    
    XCTAssertTrue((titleResult == expectedTitle), "Result: \(titleResult) | ExpectedResult: \(expectedTitle)")
    XCTAssertTrue((artistResult.identifier == expectedArtistIdentifier), "Result: \(artistResult.identifier) | ExpectedResult: \(expectedArtistIdentifier)")
    XCTAssertTrue((durationResult == expectedDuration), "Result: \(durationResult) | ExpectedResult: \(expectedDuration)")
  }
  
  /**
   *
   */
  func test_titleFormatted_trackTitle1WhenMethodCalledWithTrackAndTrackTitle1() {
    // Given
    let expectedResult: String = "TrackTitle1"
    let track = DeezerTrackModel(json: [
      "id":1,
      "title":"TrackTitle1",
      "duration":3600.0,
      "preview":"http://www.google.com/images",
      "artist":[
        "id":2,
        "name":"ArtistName1"
      ],
      ])!
    let viewModel = TrackViewModel(withTrack: track)
    
    // When
    let result: String = viewModel.titleFormatted()
    
    // Then
    XCTAssertTrue((result == expectedResult), "Result: \(result) | ExpectedResult: \(expectedResult)")
  }
  
  /**
   *
   */
  func test_titleFormatted_trackTitle1WhenMethodCalledWithTrackAndTrackTitle2() {
    // Given
    let expectedResult: String = "TrackTitle2"
    let track = DeezerTrackModel(json: [
      "id":1,
      "title":"TrackTitle2",
      "duration":3600.0,
      "preview":"http://www.google.com/images",
      "artist":[
        "id":2,
        "name":"ArtistName2"
      ],
      ])!
    let viewModel = TrackViewModel(withTrack: track)
    
    // When
    let result: String = viewModel.titleFormatted()
    
    // Then
    XCTAssertTrue((result == expectedResult), "Result: \(result) | ExpectedResult: \(expectedResult)")
  }
  
  /**
   *
   */
  func test_artistFormatted_artistName1WhenMethodCalledWithTrackAndArtistName1() {
    // Given
    let expectedResult: String = "ArtistName1"
    let track = DeezerTrackModel(json: [
      "id":1,
      "title":"TrackTitle1",
      "duration":3600.0,
      "preview":"http://www.google.com/images",
      "artist":[
        "id":2,
        "name":"ArtistName1"
      ],
      ])!
    let viewModel = TrackViewModel(withTrack: track)
    
    // When
    let result: String = viewModel.artistFormatted()
    
    // Then
    XCTAssertTrue((result == expectedResult), "Result: \(result) | ExpectedResult: \(expectedResult)")
  }
  
  /**
   *
   */
  func test_artistFormatted_artistName2WhenMethodCalledWithTrackAndArtistName2() {
    // Given
    let expectedResult: String = "ArtistName2"
    let track = DeezerTrackModel(json: [
      "id":1,
      "title":"TrackTitle1",
      "duration":3600.0,
      "preview":"http://www.google.com/images",
      "artist":[
        "id":2,
        "name":"ArtistName2"
      ],
      ])!
    let viewModel = TrackViewModel(withTrack: track)
    
    // When
    let result: String = viewModel.artistFormatted()
    
    // Then
    XCTAssertTrue((result == expectedResult), "Result: \(result) | ExpectedResult: \(expectedResult)")
  }
  
  /**
   *
   */
  func test_durationFormatted_duration1WhenMethodCalledWithTrackAndDuration1() {
    // Given
    let expectedResult: String = "1h"
    let track = DeezerTrackModel(json: [
      "id":1,
      "title":"TrackTitle1",
      "duration":3600.0,
      "preview":"http://www.google.com/images",
      "artist":[
        "id":2,
        "name":"ArtistName1"
      ],
      ])!
    let viewModel = TrackViewModel(withTrack: track)
    
    // When
    let result: String = viewModel.durationFormatted()
    
    // Then
    XCTAssertTrue((result == expectedResult), "Result: \(result) | ExpectedResult: \(expectedResult)")
  }
  
  /**
   *
   */
  func test_durationFormatted_duration2WhenMethodCalledWithTrackAndDuration2() {
    // Given
    let expectedResult: String = "5h 30m"
    let track = DeezerTrackModel(json: [
      "id":1,
      "title":"TrackTitle1",
      "duration":19800.0,
      "preview":"http://www.google.com/images",
      "artist":[
        "id":2,
        "name":"ArtistName1"
      ],
      ])!
    let viewModel = TrackViewModel(withTrack: track)
    
    // When
    let result: String = viewModel.durationFormatted()
    
    // Then
    XCTAssertTrue((result == expectedResult), "Result: \(result) | ExpectedResult: \(expectedResult)")
  }
}
