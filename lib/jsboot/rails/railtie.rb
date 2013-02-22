module Jsboot
  module Rails
    class Railtie < ::Rails::Railtie
      config.to_prepare do
        ApplicationController.helper(Jsboot::Rails::ViewHelpers)
      end
    end
  end
end
