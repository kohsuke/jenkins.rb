require 'jenkins/slaves/_computer_listener'

module Jenkins
  class Plugin
    class Proxies
      class ComputerListener < Java.hudson.slaves.ComputerListener
        include Java.jenkins.ruby.Get
        include Jenkins::Plugin::Proxy

        def preLaunch(computer, task_listener)
          @object.pre_launch(import(computer), import(task_listener))
        end

        def onLaunchFailure(computer, task_listener)
          @object.on_launch_failure(import(computer), import(task_listener))
        end

        def preOnline(computer, channel, root, task_listener)
           @object.pre_online(import(computer), import(channel), import(root), import(task_listener))
        end

        def onOnline(computer, task_listener)
          @object.on_online(import(computer), import(task_listener))
        end

        def onOffline(computer)
          @object.on_offline(import(computer))
        end

        def onConfigurationChange
          @object.on_configuration_change
        end
      end

      register Jenkins::Slaves::ComputerListener, ComputerListener
    end
  end
end
