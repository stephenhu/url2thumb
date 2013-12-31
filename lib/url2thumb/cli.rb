module Url2thumb

  class CLI < Thor

    desc( "capture", "capture url and convert into a thumbnail" )
    def capture(url)

      capy = Url2thumb::Capytool.new

      capy.to_thumbnail(url)

    end

  end

end

