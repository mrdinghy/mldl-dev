


# coding: utf-8

%w{
  issues basics people meetings
}.each do |part|
  require File.expand_path(File.dirname(__FILE__))+"/seeds/#{part}.rb"
end


