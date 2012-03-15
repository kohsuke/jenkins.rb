require 'jenkins/model/queue/_queue_task_dispatcher'

module Jenkins
  class Plugin
    class Proxies
      class QueueTaskDispatcher < Java.hudson.model.queue.QueueTaskDispatcher
        include Java.jenkins.ruby.Get
        include Jenkins::Plugin::Proxy

        def canTake(node, item)
          @object.can_take(import(node), import(item))
        end

        def canRun(item)
          @object.can_run(import(item))
        end
      end

      register Jenkins::Model::Queue::QueueTaskDispatcher, QueueTaskDispatcher
    end
  end
end
