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

import Parser

open class Renderer {
    private let ast: AST
    
    public init(ast: AST) {
        self.ast = ast
    }
    
    public func renderAST()throws -> String {
        return try ast.map(renderNode).joined()
    }
    
    private func renderText(_ node: ParagraphNode, withParagraph: Bool)throws -> String {
        let text = try node.content.map(renderNode).joined()
        if withParagraph {
            return "<p>\(text)</p>"
        } else {
            return "\(text)"
        }
    }
    
    public func renderNode(_ node: ElementNode)throws -> String {
        switch node {
        case let node as TextNode: return node.value
        case let node as HeaderOneNode: return "<h1>\(try node.content.map(renderNode).joined())</h1>"
        case let node as HeaderTwoNode: return "<h2>\(try node.content.map(renderNode).joined())</h2>"
        case let node as HeaderThreeNode: return "<h3>\(try node.content.map(renderNode).joined())</h3>"
        case let node as HeaderFourNode: return "<h4>\(try node.content.map(renderNode).joined())</h4>"
        case let node as HeaderFiveNode: return "<h5>\(try node.content.map(renderNode).joined())</h5>"
        case let node as HeaderSixNode: return "<h6>\(try node.content.map(renderNode).joined())</h6>"
        case let node as BoldNode: return "<strong>\(try node.content.map(renderNode).joined())</strong>"
        case let node as ItalicNode: return "<em>\(try node.content.map(renderNode).joined())</em>"
        case let node as LinkNode:
            let text = try node.text.map({ element in
                return try renderText(element as! ParagraphNode, withParagraph: false)
            }).joined()
            return "<a href=\"\(node.url)\">\(text)</a>"
        case let node as ImageNode: return "<img src=\"\(node.url)\" alt=\"\(node.text)\"/>"
        case _ as HorizontalRuleNode: return "<hr/>"
        case let node as CodeNode: return "<code>\(node.value)</code>"
        case let node as ParagraphNode: return "<p>\(try node.content.map(renderNode).joined())</p>"
        case let node as CodeBlockNode: return "<pre><code>\(node.code)</code></pre>"
        case let node as OrderedListNode:
            let elements = try node.content.map({ element in
                return "<li>\(try renderText(element as! ParagraphNode, withParagraph: false))</li>"
            })
            return "<ol>\(elements)</ol>"
        case let node as UnorderedListNode:
            let elements = try node.content.map({ element in
                return "<li>\(try renderText(element as! ParagraphNode, withParagraph: false))</li>"
            })
            return "<ul>\(elements)</ul>"
        case let node as BlockquoteNode:
            let elements = try node.content.map({return try renderText($0 as! ParagraphNode, withParagraph: true)}).joined()
            return "<blockquote>\(elements)</blockquote>"
        default: fatalError("Unsupported Node")
        }
    }
}