require 'jenkins/model/_async_aperiodic_work'

module Jenkins
  class Plugin
    class Proxies
      class AsyncAperiodicWork < Java.hudson.model.AsyncAperiodicWork
        include Java.jenkins.ruby.Get
        include Jenkins::Plugin::Proxy

        def initialize(plugin, object)
          super(object.name) if defined? super
          @plugin, @object = plugin, object
          @pluginid = @plugin.name
        end

        def getRecurrencePeriod
          @object.recurrence_period
        end

        def getNewInstance
          instance = @object.new_instance
          if instance.is_a?(Jenkins::Model::AsyncAperiodicWork)
            instance = AsyncAperiodicWork.new(@plugin, instance)
          end
          instance
        end

        def getInitialDelay
          @object.initial_delay || super
        end

        def createListener
          @object.create_listener || super
        end

        def getLogFile
          @object.log_file || super
        end

        def execute(listener)
          @object.execute(import(listener))
        end
      end

      register Jenkins::Model::AsyncAperiodicWork, AsyncAperiodicWork
    end
  end
end
