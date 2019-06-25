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

open class Lexer {

    public init() {}

    let tokenGenerators: [(regex: String, templates: [String], tokenGenerator: ([String])throws -> Token?)] = [
        ("\\\\(.)", ["$1"], { return .escape($0[0].safetyHTMLEncoded)}),
        ("\\`\\`\\`((.|\n|\n\r|\r)*)\\`\\`\\`", ["$1"], {return .codeBlock($0[0].safetyHTMLEncoded)}),
        ("( {4}|\\t)(.+)[\\n\\r]?", ["$2"], { return .codeBlock($0[0].safetyHTMLEncoded)}),
        ("\\#{6}\\s?([^#\n]+)\\s??\\#*", ["$1"], {return .header6(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("\\#{5}\\s?([^#\n]+)\\s??\\#*", ["$1"], { return .header5(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("\\#{4}\\s?([^#\n]+)\\s??\\#*", ["$1"], { return .header4(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("\\#{3}\\s?([^#\n]+)\\s??\\#*", ["$1"], { return .header3(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("(\\#{2}\\s?([^\\#\n]+)\\#*|(.+)\\n\\-{2,})", ["$2", "$3"], { return .header2(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("(\\#\\s?([^\\#\\n]+)\\#*|(.+)\\n\\=+)", ["$2", "$3"], { return .header1(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("(\\_{2}|\\*{2})(.+)(\\_{2}|\\*{2})", ["$2"], {return .bold(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("(((\\-|\\_|\\*)\\s?){3,})(?=\n)", [], { _ in return .horizontalRule}),
        ("(\\_|\\*)([^\\_\\*]+)(\\_|\\*)", ["$2"], { return .italic(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("\\!\\[(.+)\\]\\((.+)\\)",  ["$1", "$2"], { return .image(text: $0[0].safetyHTMLEncoded, url: $0[1])}),
        ("\\[(.+)\\]\\((.+)\\)", ["$1", "$2"], { return .link(text: try Lexer().tokenize($0[0].safetyHTMLEncoded), url: $0[1])}),
        ("\\>\\s?([^\\n\\>]+)", ["$1"], { return .blockQuote(try Lexer().tokenize($0[0]))}),
        ("(\\+|\\-|\\*)\\s?(.+)", ["$2"], { return .unOrderedList(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("\\d+\\.\\s([^\\n]+)", ["$1"], { return .orderedList(try Lexer().tokenize($0[0].safetyHTMLEncoded))}),
        ("\\`([^\\`]*)\\`", ["$1"], { return .code($0[0].safetyHTMLEncoded)}),
        ("(\n{2,}|(\n\r){2,})", [], { _ in return .break }),
        ("([^\\s]+)", ["$1"], { return .text($0[0].safetyHTMLEncoded)}),
    ]

    public func tokenize(_ string: String)throws -> [Token] {
        var tokens: [Token] = []
        var input = string

        while input.count > 0 {
            var matched = false

            for (regex, template, generator) in tokenGenerators {
                if let regexMatch = try input.match(regex: regex, with: template) {
                    if let token = try generator(regexMatch.0) {
                        tokens.append(token)
                    }
                    input = input.substring(from: input.index(input.startIndex, offsetBy: regexMatch.1.count))
                    matched = true
                    break
                }
            }
            if !matched {
                let index = input.index(input.startIndex, offsetBy: 1)
                tokens.append(.text(input.substring(to: index)))
                input = input.substring(from: index)
            }
        }
        return tokens
    }

    public enum Token {
        case header1([Token])
        case header2([Token])
        case header3([Token])
        case header4([Token])
        case header5([Token])
        case header6([Token])
        case bold([Token])
        case italic([Token])
        case link(text: [Token], url: String)
        case image(text: String, url: String)
        case blockQuote([Token])
        case orderedList([Token])
        case unOrderedList([Token])
        case codeBlock(String)
        case horizontalRule
        case code(String)
        case escape(String)
        case text(String)
        case `break`
    }
}
