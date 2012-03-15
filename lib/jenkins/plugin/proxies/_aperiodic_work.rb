require 'jenkins/model/_aperiodic_work'

module Jenkins
  class Plugin
    class Proxies
      class AperiodicWork < Java.hudson.model.AperiodicWork
        include Java.jenkins.ruby.Get
        include Jenkins::Plugin::Proxy

        def getRecurrencePeriod
          @object.recurrence_period
        end

        def getNewInstance
          instance = @object.new_instance
          if instance.is_a?(Jenkins::Model::AperiodicWork)
            instance = AperiodicWork.new(@plugin, instance)
          end
          instance
        end

        def getInitialDelay
          @object.initial_delay || super
        end

        def doAperiodicRun
          @object.do_aperiodic_run
        end
      end

      register Jenkins::Model::AperiodicWork, AperiodicWork
    end
  end
end
