module Jenkins
  module Model
    module Listeners
      class ItemListener
        ##
        # Called after a new job is created and added to {@link jenkins.model.Jenkins},
        # before the initial configuration page is provided.
        # This is useful for changing the default initial configuration of newly created jobs.
        # For example, you can enable/add builders, etc.
        #
        # @param [Jenkins::Model::Item] item
        def on_created(item)
          
        end

        ##
        # Called after a new job is created by copying from an existing job.
        #
        # For backward compatibility, the default implementation of this method calls {@link #onCreated(Item)}.
        # If you choose to handle this method, think about whether you want to call super.onCopied or not.
        #
        #
        # @param [Jenkins::Model::Item] The source item that the new one was copied from. Never null.
        # @param [Jenkins::Model::Item] The newly created item. Never null.
        #
        # @since 1.325 Before this version, a copy triggered {@link #onCreated(Item)}.
        def on_copied(src, item)
          on_created item
        end

        ##
        # Called after all the jobs are loaded from disk into {@link jenkins.model.Jenkins}
        # object.
        def on_loaded

        end

        ##
        # Called right before a job is going to be deleted.
        #
        # At this point the data files of the job is already gone.
        #
        # @param [Jenkins::Model::Item] item
        def on_deleted(item)

        end

        ##
        # Called after a job is renamed.
        #
        # @param [Jenkins::Model::Item] The job being renamed.
        # @param [String] The old name of the job.
        # @param [String] The new name of the job. Same as {@link Item#getName()}.
        # @since 1.146
        def on_renamed(item, oldName, newName)

        end
      end
    end
  end
end
