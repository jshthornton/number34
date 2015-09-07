require_relative 'configuration'
require_relative 'capabilities_helper'

module Number34
  class Core
    attr_accessor :configuration

    def self.make
      configuration = Number34::Configuration.new
      number34 = Number34::Core.new
      number34.configuration = configuration
      number34
    end

    def configure
      yield configuration if block_given?
    end

    def capabilities_collection(key)
      CapabilitiesHelper::get_collection(configuration.capabilities_map, key)
    end

    def test_against(capabilities_key, &block)
      core = self
      ::RSpec.describe capabilities_key do
        after(:each) do
          driver.quit
        end

        core.capabilities_collection(capabilities_key).each do |capabilities|
          let(:driver) do
            Selenium::WebDriver.for(
              :remote,
              :url => "http://joshuathornton1:h87dU5zZKksRW2tvqhnY@hub.browserstack.com/wd/hub",
              :desired_capabilities => capabilities
            )
          end

          self.instance_eval(&block)
        end
      end
    end
  end
end
