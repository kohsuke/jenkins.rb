require 'jenkins/model/listeners/_item_listener'

module Jenkins
  class Plugin
    class Proxies
      class ItemListener < Java.hudson.model.listeners.ItemListener
        include Java.jenkins.ruby.Get
        include Jenkins::Plugin::Proxy

        def onCreated(item)
          @object.on_created(import(item))
        end

        def onCopied(src, item)
          @object.on_copied(import(src), import(item))
        end

        def onLoaded
          @object.on_loaded()
        end

        def onDeleted(item)
          @object.on_deleted(import(item))
        end

        def onRenamed(item, oldName, newName)
          @object.on_renamed(import(item), oldName, newName)
        end
      end

      register Jenkins::Model::Listeners::ItemListener, ItemListener
    end
  end
end
