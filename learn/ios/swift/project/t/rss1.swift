// Playground - noun: a place where people can play

import UIKit

class MyParser : NSObject, NSXMLParserDelegate {
    
    var isTitle = false
    
    func parser(parser: NSXMLParser!,didStartElement elementName: String!,
        namespaceURI: String!, qualifiedName : String!,
        attributes attributeDict: NSDictionary!) {
            
            if(elementName=="title"){
                isTitle = true
            }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!,
        namespaceURI: String!, qualifiedName qName: String!) {
            isTitle = false
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        if(isTitle){
            println(string)
        }
    }
    
    func parser(parser: NSXMLParser!, parseErrorOccurred parseError: NSError!) {
        NSLog("error: \'parseError'")
    }
}


var myParser = MyParser()

var url = NSURL(string: "http://sodeveloper.blogspot.jp/feeds/posts/default")
var xmlParser = NSXMLParser(contentsOfURL: url)
xmlParser.delegate = myParser
xmlParser.parse()

