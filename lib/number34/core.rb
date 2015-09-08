require_relative 'configuration'
require_relative 'capabilities_helper'

module Number34
  def self.test_against(capabilities_key, &block)
    config = ::RSpec.configuration.number34

    ::RSpec.describe capabilities_key do
      after(:each) do
        driver.quit
      end

      capabilities_collection = Number34::CapabilitiesHelper::get_collection(config.capabilities_map, capabilities_key)

      capabilities_collection.each do |capabilities|
        let(:driver) do
          Selenium::WebDriver.for(
            :remote,
            :url => config.webdriver_url,
            :desired_capabilities => capabilities
          )
        end

        self.instance_eval(&block)
      end
    end
  end
end
