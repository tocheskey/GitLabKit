//
//  Hook.swift
//  GitLabKit
//
//  Copyright (c) 2015 orih. All rights reserved.
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

open class Hook: GitLabModel, Fetchable {
    open var id: NSNumber?
    open var url: String?
    open var projectId: NSNumber?
    open var _pushEvents: NSNumber?
    open var pushEvents: Bool {
        get { return _pushEvents != nil ? _pushEvents!.boolValue : false }
        set { _pushEvents = NSNumber(value: newValue as Bool)}
    }
    open var _issueEvents: NSNumber?
    open var issueEvents: Bool {
        get { return _issueEvents != nil ? _issueEvents!.boolValue : false }
        set { _issueEvents = NSNumber(value: newValue as Bool)}
    }
    open var _mergeRequestsEvents: NSNumber?
    open var mergeRequestsEvents: Bool {
        get { return _mergeRequestsEvents != nil ? _mergeRequestsEvents!.boolValue : false }
        set { _mergeRequestsEvents = NSNumber(value: newValue as Bool)}
    }
    open var createdAt: Date?
    
    open override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any]! {
        let baseKeys: [AnyHashable: Any] = super.jsonKeyPathsByPropertyKey()
        let newKeys: [AnyHashable: Any] = [
            "id"                   : "id",
            "url"                  : "url",
            "projectId"            : "project_id",
            "_pushEvents"          : "push_events",
            "_issueEvents"         : "issue_events",
            "_mergeRequestsEvents" : "merge_requests_events",
            "createdAt"            : "created_at",
        ]
        return baseKeys + newKeys
    }
    
    class func createdAtJSONTransformer() -> ValueTransformer {
        return dateTimeTransformer
    }
}
