module Jenkins
  module Model
    class Item

      attr_reader :native

      def initialize(native = nil)
        @native = native
      end

      def name
        @native.getName()
      end

      def full_name
        @native.getFullName()
      end

      def display_name
        @native.getDisplayName()
      end

      def full_display_name
        @native.getFullDisplayName()
      end

      def url
        @native.getUrl()
      end

      def short_url
        @native.getShortUrl()
      end

      Jenkins::Plugin::Proxies.register self, Java.hudson.model.Item
    end
  end
end