# encoding: UTF-8

require_relative './test_helper'

class NodePiTest < Minitest::Test
  def setup
    xp = LibXML::XML::Parser.string('<root></root>')
    @doc = xp.parse
    assert_instance_of(LibXML::XML::Document, @doc)
    @root = @doc.root
  end

  def test_libxml_node_add_pi_01
    @root << LibXML::XML::Node.new_pi('mypi')
    assert_equal '<root><?mypi?></root>',
      @root.to_s.gsub(/\n\s*/,'')
  end

  def test_libxml_node_add_pi_02
    @root << LibXML::XML::Node.new_pi('mypi')
    assert_equal 'pi',
    @root.child.node_type_name
  end

  def test_libxml_node_add_pi_03
    @root << el = LibXML::XML::Node.new_pi('mypi')
    el << "_this_is_added"
    assert_equal '<root><?mypi _this_is_added?></root>',
    @root.to_s.gsub(/\n\s*/,'')
  end

  def test_libxml_node_add_pi_04
    @root << LibXML::XML::Node.new_pi('mypi','mycontent')
    assert_equal '<root><?mypi mycontent?></root>',
      @root.to_s.gsub(/\n\s*/,'')
  end
end
