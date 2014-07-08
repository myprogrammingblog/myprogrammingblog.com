require_relative 'xml_parser'


#
#  Test Output
#
parser = XML::Parser.new("properties.xml")

parser.insert_xml_element("stylesheets", "file", ["best", "rest"], {before: "\t", after: "\n\t\t"})
parser.insert_xml_element("widgets", "widget", ["mywidget", "yourwidget"], {before: "\t", after: "\n\t\t\t"})
parser.delete_xml_element("stylesheets", "file", "sample4")
parser.delete_xml_element("stylesheets", "file", "sample3")
parser.delete_xml_element("stylesheets", "file", "sample2")
parser.delete_xml_element("stylesheets", "file", "sample1")

puts parser.doc