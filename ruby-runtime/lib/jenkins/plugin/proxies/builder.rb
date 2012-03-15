require 'jenkins/tasks/builder'
require 'jenkins/plugin/proxies/build_step'

module Jenkins
  class Plugin
    class Proxies
      class Builder < Java.hudson.tasks.Builder
        include Java.jenkins.ruby.Get
        include Jenkins::Plugin::Proxy

        include BuildStep

        def getDescriptor
          @plugin.descriptors[@object.class]
        end

        def get(name)
          @object.respond_to?(name) ? @object.send(name) : nil
        end
      end

      register Jenkins::Tasks::Builder, Builder
    end
  end
end
