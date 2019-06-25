//The MIT License (MIT)
//
//Copyright (c) 2017 Caleb Kleveter
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import Foundation

extension CharacterSet {

    /// Returns a character set containing the characters that are dangerous in XML and HTML: <, > and &
    static var dangerousASCII: CharacterSet {
        return CharacterSet(charactersIn: "<>&")
    }
}

extension String {

    /// A representation of the string encoded to prevent HTML/XML injection.
    var safetyHTMLEncoded: String {
        let htmlAsciiCodes: [String: String] = ["<": "&lt;", ">": "&gt;", "&": "&amp;"]
        var finalString = ""
        _ = self.map {
            if CharacterSet.dangerousASCII.contains($0.unicodeScalars.first!) {
                finalString.append(htmlAsciiCodes[String($0)]!)
            } else {
                finalString.append(String($0))
            }
        }
        return finalString
    }
}
