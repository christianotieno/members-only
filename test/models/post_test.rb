# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: 'This is a title', content: 'This is a content')
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'title should be present' do
    @post.title = '    '
    assert_not @post.valid?
  end

  test 'content should be present' do
    @post.content = '    '
    assert_not @post.valid?
  end

  test 'title should not be too long' do
    @post.title = 'a' * 100
    assert_not @post.valid?
  end

  test 'content should not be too long' do
    @post.content = 'a' * 8000
    assert_not @post.valid?
  end
end
