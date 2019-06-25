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
        return  ast.map(renderNode).joined()
    }

    private func renderText(_ node: ParagraphNode, withParagraph: Bool) -> String {
        let text =  node.content.map(renderNode).joined()
        if withParagraph {
          return text.tagged(with: "p")
        } else {
            return "\(text)"
        }
    }

    public func renderNode(_ node: ElementNode) -> String {
        switch node {
        case let node as TextNode: return renderText(node: node)
        case let node as HeaderOneNode: return  renderHeaderOne(node: node)
        case let node as HeaderTwoNode: return  renderHeaderTwo(node: node)
        case let node as HeaderThreeNode: return  renderHeaderThree(node: node)
        case let node as HeaderFourNode: return  renderHeaderFour(node: node)
        case let node as HeaderFiveNode: return  renderHeaderFive(node: node)
        case let node as HeaderSixNode: return  renderHeaderSix(node: node)
        case let node as BoldNode: return  renderBold(node: node)
        case let node as ItalicNode: return  renderItalic(node: node)
        case let node as LinkNode: return  renderLink(node: node)
        case let node as ImageNode: return renderImage(node: node)
        case let node as HorizontalRuleNode: return renderHorizontalRule(node: node)
        case let node as BreakNode: return renderBreak(node: node)
        case let node as CodeNode: return renderCode(node: node)
        case let node as ParagraphNode: return  renderParagraph(node: node)
        case let node as CodeBlockNode: return renderCodeBlock(node: node)
        case let node as OrderedListNode: return  renderOrderedList(node: node)
        case let node as UnorderedListNode: return  renderUnorderedList(node: node)
        case let node as BlockquoteNode: return  renderBlockquote(node: node)
        default: fatalError("Unsupported Node")
        }
    }

    private func renderText(node: TextNode) -> String {
        return node.value
    }

    private func renderHeaderOne(node: HeaderOneNode) -> String {
        let text =  node.content.map({ element in
            return  renderText(element as! ParagraphNode, withParagraph: false)
        }).joined()
        return text.tagged(with: "h1")
    }

    private func renderHeaderTwo(node: HeaderTwoNode) -> String {
        let text =  node.content.map({ element in
            return  renderText(element as! ParagraphNode, withParagraph: false)
        }).joined()
        return text.tagged(with: "h2")
    }

    private func renderHeaderThree(node: HeaderThreeNode) -> String {
        let text =  node.content.map({ element in
            return  renderText(element as! ParagraphNode, withParagraph: false)
        }).joined()
        return text.tagged(with: "h3")
    }

    private func renderHeaderFour(node: HeaderFourNode) -> String {
        let text =  node.content.map({ element in
            return  renderText(element as! ParagraphNode, withParagraph: false)
        }).joined()
        return text.tagged(with: "h4")
    }

    private func renderHeaderFive(node: HeaderFiveNode) -> String {
        let text =  node.content.map({ element in
            return  renderText(element as! ParagraphNode, withParagraph: false)
        }).joined()
        return text.tagged(with: "h5")
    }

    private func renderHeaderSix(node: HeaderSixNode) -> String {
        let text =  node.content.map({ element in
            return  renderText(element as! ParagraphNode, withParagraph: false)
        }).joined()
        return text.tagged(with: "h6")
    }

    private func renderBold(node: BoldNode) -> String {
        let text =  node.content.map({ element in
            return  renderText(element as! ParagraphNode, withParagraph: false)
        }).joined()
        return text.tagged(with: "strong")
    }

    private func renderItalic(node: ItalicNode) -> String {
        let text =  node.content.map({ element in
            return  renderText(element as! ParagraphNode, withParagraph: false)
        }).joined()
        return text.tagged(with: "em")
    }

    private func renderLink(node: LinkNode) -> String {
        let text =  node.text.map({ element in
            return  renderText(element as! ParagraphNode, withParagraph: false)
        }).joined()
        return text.tagged(with: "a", attributes: ["href": node.url])
    }

    private func renderImage(node: ImageNode) -> String {
        return String.tag(with: "img", attributes: ["src": node.url, "alt": node.text])
    }

    private func renderHorizontalRule(node: HorizontalRuleNode) -> String {
        return String.tag(with: "hr")
    }

    private func renderBreak(node: BreakNode) -> String {
        return String.tag(with: "br")
    }

    private func renderCode(node: CodeNode) -> String {
        return node.value.tagged(with: "code")
    }

    private func renderParagraph(node: ParagraphNode) -> String {
        return node.content.map(renderNode).joined().tagged(with: "p")
    }

    private func renderCodeBlock(node: CodeBlockNode) -> String {
        return node.code.joined(separator: "\n").tagged(with: "code").tagged(with: "pre")
    }

    private func renderOrderedList(node: OrderedListNode) -> String {
        let elements =  node.content.map({ element in
            return renderText(element as! ParagraphNode, withParagraph: false).tagged(with: "li")
        }).joined()
        return elements.tagged(with: "ol")
    }

    private func renderUnorderedList(node: UnorderedListNode) -> String {
        let elements =  node.content.map({ element in
            return renderText(element as! ParagraphNode, withParagraph: false).tagged(with: "li")
        }).joined()
        return elements.tagged(with: "ul")
    }

    private func renderBlockquote(node: BlockquoteNode) -> String {
        let elements =  node.content.map({
            return renderText($0 as! ParagraphNode, withParagraph: true)
        }).joined()
        return elements.tagged(with: "blockquote")
    }
}
