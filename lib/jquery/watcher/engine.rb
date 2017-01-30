module Jquery
  module Watcher
    class Engine < ::Rails::Engine
      initializer 'jquery-watcher.assets.precompile' do |app|
        app.config.assets.paths << root.join('assets', 'javascripts').to_s
      end
    end
  end
end
