class AlavetelithemeEngine < Rails::Engine
  puts "AlavetelithemeEngine|class|#{self.class}"

  initializer "alavetelitheme.configure_rails_initialization" do |app|
    puts "Alavetelitheme<Engine|#{app}"
    #puts "Alavetelitheme<Railtie|#{app}"

    ['stylesheets', 'images', 'javascripts'].each do |asset_type|
      theme_asset_path = File.join(File.dirname(__FILE__),
                                   '..',
                                   'app',
                                   'assets',
                                   asset_type)
      theme_asset_path = File.expand_path(theme_asset_path)
      puts "Alavetelitheme<Railtie|prepending|#{theme_asset_path}"
      app.config.assets.paths.unshift theme_asset_path
      puts "AlavetelithemeEngine|first_path|#{app.config.assets.paths.first}"
      puts "AlavetelithemeEngine|last_path|#{app.config.assets.paths.last}"
    end


    theme_asset_path = File.join(File.dirname(__FILE__),
                                 '..',
                                 'app',
                                 'assets',
                                 'stylesheets')
    theme_sass_path = File.expand_path(theme_asset_path)
    config.sass.load_paths.unshift(theme_sass_path)
  end
end
