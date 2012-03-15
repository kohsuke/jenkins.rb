require 'jenkins/model/_periodic_work'

module Jenkins
  class Plugin
    class Proxies
      class PeriodicWork < Java.hudson.model.PeriodicWork
        include Java.jenkins.ruby.Get
        include Jenkins::Plugin::Proxy

        def getRecurrencePeriod
          @object.recurrence_period
        end

        def getInitialDelay
          @object.initial_delay || super
        end

        def doRun
          @object.do_run
        end
      end

      register Jenkins::Model::PeriodicWork, PeriodicWork
    end
  end
end
