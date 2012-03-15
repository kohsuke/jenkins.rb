module Jenkins
  module Model
    module Queue
      class CauseOfBlockage

        attr_reader :native

        def initialize(native = nil)
          @native = native
        end

        def short_description
          @native.getShortDescription
        end

        def self.from_message(msg)
          obj = Java.hudson.model.queue.CauseOfBlockage.new
          def obj.getShortDescription
            msg
          end
          CauseOfBlockage.new(obj)
        end

        Jenkins::Plugin::Proxies.register self, Java.hudson.model.queue.CauseOfBlockage
      end
    end
  end
end
