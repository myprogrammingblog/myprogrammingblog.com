#
# What? Wrapper Around nokogiri to be able to succesfully insert and delete xml elements
# Why ? Nokogiri too cumbersome
# @author: Anatoly Spektor
# @version: 0.3
# Last Upadted: July 7, 2014

#
# Future Plans:
#  - Add Validation
#  - Add Unit Tests
#  - Put into a Gem

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

    # Params
    # * parent parent tag e.g <javascripts></javascripts>
    # * tag - actual tag that will wrap your data
    # * data actual data - Array or String
    # * formatting - can have before and after which will be added before and after xml element

    def insert_xml_element(parent, tag, data, formatting = {})
      if (data.instance_of?(Array))
        data.each do |value|
          node = Nokogiri::XML::Node.new tag, @doc
          node.content = value
          format_and_append(parent, node, formatting)
        end
      else
        node = Nokogiri::XML::Node.new tag, @doc
        node.content = data
        format_and_append(parent, node, formatting)
      end
    end

    # Params
    # * parent parent tag e.g <javascripts></javascripts>
    # * tag - actual tag that will wrap your data
    # * data actual data - Array or String

    def delete_xml_element(parent, tag, data)
      @doc.css(parent+" " + tag).each do |node|
        node.remove if node.content == data
      end

    end

    private

    def format_and_append(parent, node, formatting)
      @doc.css(parent).children.after(formatting[:before]) if formatting.key? :before
      @doc.css(parent).children.after(node)
      @doc.css(parent).children.after(formatting[:after]) if formatting.key? :after
    end


  end
end







