require 'nokogiri'
module XML
  class Parser

    def doc
      @doc.to_xml.gsub(/^\s*\n/, "")
    end

    def self.file
      @file
    end

    def initialize(file)
      @file = File.read(file)
      @doc = Nokogiri::XML::Document.parse(@file)
    end

    def insert_xml_element(parent,tag,data,formatting = {})
      if (data.instance_of?(Array))
        data.each do|value|
          node = Nokogiri::XML::Node.new tag, @doc
          node.content = value
          format_and_append(parent,node, formatting)
        end
      else
        node = Nokogiri::XML::Node.new tag, @doc
        node.content = data
        format_and_append(parent,node, formatting)
      end
    end

    def delete_xml_element(parent,tag,data)

      @doc.css(parent+" " + tag).each do |node|
        node.remove if node.content == data
      end

    end

    private

    def format_and_append(parent,node, formatting)
      @doc.css(parent).children.after(formatting[:before]) if formatting.key? :before
      @doc.css(parent).children.after(node)
      @doc.css(parent).children.after(formatting[:after]) if formatting.key? :after
    end


  end
end


parser = XML::Parser.new("properties.xml")

parser.insert_xml_element("stylesheets","file",["best","rest"], {before:"\t", after:"\n\t\t"})
parser.insert_xml_element("widgets","widget",["mywidget","yourwidget"], {before:"\t", after:"\n\t\t\t"})
#puts parser.doc
parser.delete_xml_element("stylesheets","file","sample4")
parser.delete_xml_element("stylesheets","file","sample3")
parser.delete_xml_element("stylesheets","file","sample2")
parser.delete_xml_element("stylesheets","file","sample1")

puts parser.doc







