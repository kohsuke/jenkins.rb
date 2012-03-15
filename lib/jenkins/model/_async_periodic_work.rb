module Jenkins
  module Model
    class AsyncPeriodicWork
      def initialize(name = nil)
        @name = name
      end

      attr_accessor :name

      def recurrence_period

      end

      def initial_delay

      end

      def create_listener

      end

      def log_file

      end

      def execute(listener)

      end
    end
  end
end
