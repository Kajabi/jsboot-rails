module Jsboot
  module Rails

    module ViewHelpers
      def jsboot_data_tag(data, key = jsboot_default_key)
        id = "jsboot-#{key}"
        id.tr!('#', '-')

        content_tag :script, :id => id, :class => "jsboot-data", :type => "application/json" do
          jsboot_json_escape data.to_json.html_safe
        end
      end

      private

      def jsboot_default_key
        [params[:controller], params[:action]].join("#")
      end

      def jsboot_json_escape(s)
        result = s.to_s.gsub('/', '\/')
        s.html_safe? ? result.html_safe : result
      end
    end

  end
end

