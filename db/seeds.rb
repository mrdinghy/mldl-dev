


# coding: utf-8

%w{
  basics issues people meetings
}.each do |part|
  require File.expand_path(File.dirname(__FILE__))+"/seeds/#{part}.rb"
end


