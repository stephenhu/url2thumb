module Url2thumb

  class Capytool
    include Capybara::DSL

    def initialize

      Capybara.configure do |config|
        config.run_server         = false
        config.default_driver
        config.current_driver     = :webkit
        config.app                = "generic"
        config.app_host           = ""
      end

    end

    def to_thumbnail( url, dest=BASEDIR )

      visit url

      page.driver.resize_window( 1024, 768 )

      hash = Digest::MD5.hexdigest(url)

      filename = dest + SLASH + hash[0..8] + PNGEXT

      if File.exists?(filename)

        $stderr.puts "File already exists, no action taken.".yellow

      else

        page.save_screenshot( filename, width: 1024, height: 768 )

        $stdout.puts "#{filename} created.".green

      end

    end

  end

end

