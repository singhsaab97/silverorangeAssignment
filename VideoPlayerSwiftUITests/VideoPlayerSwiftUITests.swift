//
//  VideoPlayerSwiftUITests.swift
//  VideoPlayerSwiftUITests
//
//  Created by Michael Gauthier on 2021-01-06.
//

import XCTest
@testable import VideoPlayerSwiftUI

class VideoPlayerSwiftUITests: XCTestCase {
    
    private var viewModel: VideoPlayerViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = VideoPlayerViewModel(isMockRequest: true)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewModel = nil
    }

    func testInitialVideoPlayerState() {
        XCTAssertNil(viewModel.currentVideo)
        XCTAssertTrue(viewModel.isPreviousButtonDisabled)
        XCTAssertFalse(viewModel.isNextButtonDisabled)
    }
    
    func testVideosFetchedSuccess() {
        viewModel.progressViewAppeared(result: .success)
        XCTAssertEqual(viewModel.videos.count, 2)
        XCTAssertNotNil(viewModel.currentVideo)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testVideosFetchedFailure() {
        viewModel.progressViewAppeared(result: .failure)
        XCTAssertTrue(viewModel.videos.isEmpty)
        XCTAssertNil(viewModel.currentVideo)
        XCTAssertNotNil(viewModel.errorMessage)
    }
    
    func testPreviousAndNextButtonActions() {
        viewModel.progressViewAppeared(result: .success)
        XCTAssertTrue(viewModel.isPreviousButtonDisabled)
        XCTAssertFalse(viewModel.isNextButtonDisabled)
        viewModel.nextButtonTapped()
        XCTAssertFalse(viewModel.isPreviousButtonDisabled)
        XCTAssertFalse(viewModel.isPlaying)
        XCTAssertTrue(viewModel.isNextButtonDisabled)
        viewModel.previousButtonTapped()
        XCTAssertTrue(viewModel.isPreviousButtonDisabled)
        XCTAssertFalse(viewModel.isPlaying)
        XCTAssertFalse(viewModel.isNextButtonDisabled)
    }
    
    func testPlayPauseButtonAction() {
        XCTAssertFalse(viewModel.isPlaying)
        viewModel.playPauseButtonTapped()
        XCTAssertTrue(viewModel.isPlaying)
        viewModel.playPauseButtonTapped()
        XCTAssertFalse(viewModel.isPlaying)
    }
    
}
