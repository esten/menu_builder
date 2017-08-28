require 'rubygems'
require 'test/unit'

require 'action_controller'
require 'action_view'
require 'action_view/template'
require 'active_support'
require 'rails/railtie'

$:.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'menu_builder'

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each { |f| require f }

MenuBuilder::Routes = ActionDispatch::Routing::RouteSet.new
MenuBuilder::Routes.draw do
  get ':controller(/:action(/:id(.:format)))'
end

class ApplicationController < ActionController::Base; end
ActionController::Base.send :include, MenuBuilder::Routes.url_helpers