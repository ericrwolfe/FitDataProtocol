//
//  EncoderValidator.swift
//  FitDataProtocol
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// File Type Validator Protocol
internal protocol EncoderFileTypeValidator {
    static func validate(fildIdMessage: FileIdMessage, messages: [FitMessage]) throws
}

/// Encoder Validator
internal struct EncoderValidator {

    static func validate(fildIdMessage: FileIdMessage, messages: [FitMessage], dataValidityStrategy: FitFileEncoder.ValidityStrategy) throws {

        switch dataValidityStrategy {
        case .none:
        break // do nothing
        case .fileType:

            guard let fileType = fildIdMessage.fileType else {
                throw FitError(.encodeError(msg: "File Type should not be nil"))
            }

            switch fileType {
            case FileType.activity:
                try validateActivity(fildIdMessage: fildIdMessage, messages: messages, isGarmin: false)

            case FileType.workout:
                try WorkoutFileEncoderValidator.validate(fildIdMessage: fildIdMessage, messages: messages)

            case FileType.goals:
                try GoalsFileEncoderValidator.validate(fildIdMessage: fildIdMessage, messages: messages)

            default:
                break
            }

        case .garminConnect:
            guard fildIdMessage.fileType != nil else {
                throw FitError(.encodeError(msg: "File Type should not be nil"))
            }

            try validateActivity(fildIdMessage: fildIdMessage, messages: messages, isGarmin: true)
            try validateGarminConnect(fildIdMessage: fildIdMessage, messages: messages)
        }

    }
}


private extension EncoderValidator {

    private static func validateActivity(fildIdMessage: FileIdMessage, messages: [FitMessage], isGarmin: Bool) throws {
        //An activity file shall contain file_id, activity, session, and lap messages

        let msg = isGarmin == true ? "GarminConnect" : "Activity Files"

        /// this should have already been established
        guard fildIdMessage.fileType == FileType.activity else {
            throw FitError(.encodeError(msg: "\(msg) require FileType.activity"))
        }

        guard fildIdMessage.manufacturer != nil else {
            throw FitError(.encodeError(msg: "\(msg) require FileIdMessage to contain Manufacturer, can not be nil"))
        }

        guard fildIdMessage.product != nil else {
            throw FitError(.encodeError(msg: "\(msg) require FileIdMessage to contain product, can not be nil"))
        }

        guard fildIdMessage.deviceSerialNumber != nil else {
            throw FitError(.encodeError(msg: "\(msg) require FileIdMessage to contain deviceSerialNumber, can not be nil"))
        }

        guard fildIdMessage.fileCreationDate != nil else {
            throw FitError(.encodeError(msg: "\(msg) require FileIdMessage to contain fileCreationDate, can not be nil"))
        }

        if containsMessage(SessionMessage.self, messages: messages) == false {
            throw FitError(.encodeError(msg: "\(msg) require SessionMessage"))
        }

        if containsMessage(ActivityMessage.self, messages: messages) == false {
            throw FitError(.encodeError(msg: "\(msg) require ActivityMessage"))
        }

    }

    private static func validateGarminConnect(fildIdMessage: FileIdMessage, messages: [FitMessage]) throws {

        /// Garmin Connect Requires
        /// - File type == 4 Activity
        /// - DeviceInfo message
        /// - Record messages
        /// - Lap Message ( however we know it works without)
        /// - Session message - 1 Only
        /// - Activity Message

        if containsMessage(DeviceInfoMessage.self, messages: messages) == false {
            throw FitError(.encodeError(msg: "Garmin Connect requires DeviceInfoMessage"))
        }

        if containsMessage(RecordMessage.self, messages: messages) == false {
            throw FitError(.encodeError(msg: "Garmin Connect requires RecordMessage"))
        }

        if countMessages(SessionMessage.self, messages: messages) != 1 {
            throw FitError(.encodeError(msg: "Garmin Connect requires 1 Session Message"))
        }
    }

}

internal extension EncoderValidator {

    /// Count of Message Types in the Message Array
    ///
    /// - Parameters:
    ///   - msgType: FitMessage Type
    ///   - messages: FitMessages
    /// - Returns: Count of msgType
    internal static func countMessages(_ msgType: FitMessage.Type, messages: [FitMessage]) -> Int {

        let count = messages.reduce(0) { (total: Int, message: FitMessage) -> Int in

            if type(of: message).globalMessageNumber() == msgType.globalMessageNumber() {
                return total + 1
            }

            return total
        }

        return count
    }

    /// Checks if Array Contains a FitMessage Type
    ///
    /// - Parameters:
    ///   - msgType: FitMessage Type
    ///   - messages: FitMessages
    /// - Returns: True if msgType is contained in array
    internal static func containsMessage(_ msgType: FitMessage.Type, messages: [FitMessage]) -> Bool {

        if messages.contains(where: { (fitmessage) -> Bool in

            if type(of: fitmessage).globalMessageNumber() == msgType.globalMessageNumber() {
                return true
            }
            return false
        }) {
            return true
        }

        return false
    }
}