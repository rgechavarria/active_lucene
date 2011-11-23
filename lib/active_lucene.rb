require 'java'
require 'active_support'
require 'active_support/hash_with_indifferent_access'
require 'java_classes'

if defined? Rails.root
  APP_ROOT = Rails.root
  APP_ENV  = Rails.env
elsif not defined? APP_ROOT
  APP_ROOT = '.'
  APP_ENV  = 'default'
end

%w(document index index/reader index/writer index/searcher dictionary query search_result suggest term).each do |name| 
  require "active_lucene/#{name}"
end

module ActiveLucene
  ID = 'id'
  ALL = '_all'
  TYPE = '_type'
end

#This was deprecated in rails 2.3 
#TODO: change the gem to use Object#tap instead
class Object
  def returning(value)
    yield(value)
    value
  end
end