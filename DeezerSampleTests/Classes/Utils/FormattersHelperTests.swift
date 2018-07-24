//
//  FormattersHelperTests.swift
//  DeezerSampleTests
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import XCTest
@testable import DeezerSample

class FormattersHelperTests: XCTestCase {
  
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
   * Generic Test
   */
  func test_formatGenericDuration_generic(_ duration: TimeInterval, _ expectedResult: String) {
    // Given
    // --
    
    // When
    let result = FormattersHelper.formatGenericDuration(duration)
    
    // Then
    XCTAssertTrue(result == expectedResult, "Result: \(result) | Expected result: \(expectedResult)")
  }
  
  /**
   * Format "0s" when duration is 0s
   */
  func test_formatGenericDuration_0s_when_timeIs0() {
    // Given
    let expectedResult: String = "0s"
    let duration: TimeInterval = 0
    
    // When / Then
    test_formatGenericDuration_generic(duration, expectedResult)
  }
  
  /**
   * Format "35m" when duration is 2100
   */
  func test_formatGenericDuration_35m_when_timeIs1hour() {
    // Given
    let expectedResult: String = "35m"
    let duration: TimeInterval = 2100
    
    // When / Then
    test_formatGenericDuration_generic(duration, expectedResult)
  }
  
  /**
   * Format "1h" when duration is 3600s
   */
  func test_formatGenericDuration_1h_when_timeIs1hour() {
    // Given
    let expectedResult: String = "1h"
    let duration: TimeInterval = 3600
    
    // When / Then
    test_formatGenericDuration_generic(duration, expectedResult)
  }
  
  /**
   * Format "24h 30m" when duration is 88200
   */
  func test_formatGenericDuration_24h30m_when_timeIs24hours30minutes() {
    // Given
    let expectedResult: String = "24h 30m"
    let duration: TimeInterval = 88200
    
    // When / Then
    test_formatGenericDuration_generic(duration, expectedResult)
  }
  
  /**
   *
   */
  func test_formatGenericDuration_100h_when_timeIs100hours() {
    // Given
    let expectedResult: String = "100h"
    let duration: TimeInterval = 360000
    
    // When / Then
    test_formatGenericDuration_generic(duration, expectedResult)
  }
}
