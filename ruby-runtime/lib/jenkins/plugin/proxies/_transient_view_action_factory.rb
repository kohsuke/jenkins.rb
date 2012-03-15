require 'jenkins/model/_transient_view_action_factory'

module Jenkins
  class Plugin
    class Proxies
      class TransientViewActionFactory < Java.hudson.model.TransientViewActionFactory
        include Java.jenkins.ruby.Get
        include Jenkins::Plugin::Proxy

        def createFor(view)
          @object.create_for(import(view))
        end
      end

      register Jenkins::Model::TransientViewActionFactory, TransientViewActionFactory
    end
  end
end