module Url2thumb

  class CLI < Thor

    desc( "capture", "capture url and convert into a thumbnail" )
    method_option :output, :aliases => "-o", :type => :string,
      :required => false, :desc => "output directory"
    def capture(url)

      capy = Url2thumb::Capytool.new

      if options[:output].nil?
        dest = "."
      else
        dest = options[:output]
      end

      capy.to_thumbnail( url, dest )

    end

  end

end

