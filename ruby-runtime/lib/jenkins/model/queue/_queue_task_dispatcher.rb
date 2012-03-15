module Jenkins
  module Model
    module Queue
      class QueueTaskDispatcher
        ##
        # Called when {@link Queue} is deciding where to execute the given task.
        #
        # <p>
        # Implementations can return null to indicate that the assignment is fine, or it can return
        # a non-null instance to block the execution of the task on the given node.
        #
        # <p>
        # Queue doesn't remember/cache the response from dispatchers, and instead it'll keep asking.
        # The upside of this is that it's very easy to block execution for a limited time period (
        # as you just need to return null when it's ready to execute.) The downside of this is that
        # the decision needs to be made quickly.
        #
        # <p>
        # This method is primarily designed to fine-tune where the execution should take place. If the execution
        # shouldn't commence anywhere at all, implementation should use {@link #canRun(Item)} instead so
        # that Jenkins understands the difference between "this node isn't the right place for this work"
        # vs "the time isn't right for this work to execute." This affects the provisioning behaviour
        # with elastic Jenkins deployments.
        #
        # <p>
        # Vetos are additive. When multiple {@link QueueTaskDispatcher}s are in the system,
        # the task won't run on the given node if any one of them returns a non-null value.
        # (This relationship is also the same with built-in check logic.)
        #
        # @since 1.413
        #
        def can_take(node, item)

        end

        ##
        # Called whenever {@link Queue} is considering if {@link Queue.Item} is ready to execute immediately
        # (which doesn't necessarily mean that it gets executed right away &mdash; it's still subject to
        # executor availability), or if it should be considered blocked.
        #
        # <p>
        # Compared to {@link #canTake(Node, BuildableItem)}, this version tells Jenkins that the task is
        # simply not ready to execute, even if there's available executor. This is more efficient
        # than {@link #canTake(Node, BuildableItem)}, and it sends the right signal to Jenkins so that
        # it won't use {@link Cloud} to try to provision new executors.
        #
        # <p>
        # Vetos are additive. When multiple {@link QueueTaskDispatcher}s are in the system,
        # the task is considered blocked if any one of them returns a non-null value.
        # (This relationship is also the same with built-in check logic.)
        #
        # <p>
        # If a {@link QueueTaskDispatcher} returns non-null from this method, the task is placed into
        # the 'blocked' state, and generally speaking it stays in this state for a few seconds before
        # its state gets re-evaluated. If a {@link QueueTaskDispatcher} wants the blockage condition
        # to be re-evaluated earlier, call {@link Queue#scheduleMaintenance()} to initiate that process.
        #
        # @return
        #      null to indicate that the item is ready to proceed to the buildable state as far as this
        #      {@link QueueTaskDispatcher} is concerned. Otherwise return an object that indicates why
        #      the build is blocked.
        # @since 1.427
        #
        def can_run(item)

        end
      end
    end
  end
end
