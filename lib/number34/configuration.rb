
module Number34
  class Configuration
    attr_accessor :capabilities_map, :webdriver_url

    def initialize
      @capabilities_map = {}
    end
  end
end