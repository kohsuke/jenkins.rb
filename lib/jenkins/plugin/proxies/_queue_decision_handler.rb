require 'jenkins/model/queue/_queue_decision_handler'

module Jenkins
  class Plugin
    class Proxies
      class QueueDecisionHandler < Java.hudson.model.Queue::QueueDecisionHandler
        include Java.jenkins.ruby.Get
        include Jenkins::Plugin::Proxy

        def shouldSchedule(task, actions)
          @object.should_schedule(import(task), actions)
        end
      end

      register Jenkins::Model::Queue::QueueDecisionHandler, QueueDecisionHandler
    end
  end
end
