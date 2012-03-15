require 'jenkins/model/queue/_cause_of_blockage'
require 'jenkins/model/_job'

module Jenkins
  module Model
    class AbstractProject < Job

      attr_reader :native

      def initialize(native = nil)
        @native = native
      end

      def on_created_from_scratch
        @native.onCreatedFromScratch
      end

      def on_load(parent, name)
        @native.onLoad(parent, name)
      end

      def perform_delete
        @native.performDelete
      end
      protected :perform_delete

      def concurrent_build?
        @native.isConcurrentBuild
      end

      def concurrent_build=(b)
        @native.setConcurrentBuild(b)
      end

      def assigned_label
        @native.getAssignedLabel
      end

      def assigned_label_string
        @native.getAssignedLabelString
      end

      def assigned_label=(l)
        @native.setAssignedLabel(l)
      end

      def assigned_node=(l)
        @native.setAssignedNode(l)
      end

      def pronoun
        @native.getPronoun
      end

      def build_now_text
        @native.getBuildNowText
      end

      def root_project
        @native.getRootProject
      end

      def some_workspace
        @native.getSomeWorkspace
      end

      def some_build_with_workspace
        @native.getSomeBuildWithWorkspace
      end

      def quiet_period
        @native.getQuietPeriod
      end

      def scm_checkout_retry_count
        @native.getScmCheckoutRetryCount
      end

      def has_custom_quiet_period?
        @native.getHasCustomQuietPeriod
      end

      def quiet_period=(seconds)
        @native.setQuietPeriod(seconds)
      end

      def has_custom_scm_checkout_retry_count?
        @native.hasCustomScmCheckoutRetryCount
      end

      def is_buildable?
        @native.isBuildable
      end

      def is_configurable?
        @native.isConfigurable
      end

      def block_build_when_downstream_building?
        @native.blockBuildWhenDownstreamBuilding
      end

      def block_build_when_downstream_building=(b)
        @native.setBlockBuildWhenDownstreamBuilding(b)
      end

      def block_build_when_upstream_building?
        @native.blockBuildWhenUpstreamBuilding
      end

      def block_build_when_upstream_building=(b)
        @native.setBlockBuildWhenUpstreamBuilding(b)
      end

      def is_disabled?
        @native.isDisabled
      end

      def do_check_retry_count(value)
        @native.doCheckRetryCount(value)
      end

      def make_disabled(b)
        @native.makeDisabled(b)
      end

      def disable
        @native.disable
      end

      def enable
        @native.enable
      end

      def icon_color
        @native.getIconColor
      end

      def update_transient_actions
        @native.updateTransientActions
      end
      protected :update_transient_actions

      def create_transient_actions
        @native.createTransientActions
      end
      protected :create_transient_actions

      def add_property(job_prop)
        @native.addProperty(job_prop)
      end

      def prominent_actions
        @native.getProminentActions
      end

      def do_config_submit(req, rsp)
        @native.doConfigSubmit(req, rsp)
      end

      def schedule_build?(*args)
        @native.scheduleBuild(*args)
      end

      def schedule_build2(*args)
        @native.scheduleBuild2(*args)
      end

      def schedule_polling?
        @native.schedulePolling
      end

      def in_queue?
        @native.isInQueue
      end

      def queue_item
        @native.getQueueItem
      end

      def jdk
        @native.getJDK
      end

      def jdk=(jdk)
        @native.setJDK(jdk)
      end

      def _runs
        @native._getRuns
      end

      def remove_run(run)
        @native.removeRun(run)
      end

      def new_build
        @native.newBuild
      end
      protected :new_build

      def load_build(dir)
        @native.loadBuild(dir)
      end
      protected :load_build

      def actions
        @native.getActions
      end

      def last_built_on
        @native.getLastBuiltOn
      end

      def same_node_constraint
        @native.getSameNodeConstraint
      end

      def owner_task
        @native.getOwnerTask
      end

      def build_blocked?
        @native.isBuildBlocked
      end

      def why_blocked
        @native.getWhyBlocked
      end

      class BecauseOfBuildInProgress < Jenkins::Model::Queue::CauseOfBlockage
        attr_reader :native

        def initialize(native = nil)
          @native = native
        end

        def short_description
          @native.getShortDescription
        end
      end

      class BecauseOfDownstreamBuildInProgress < Jenkins::Model::Queue::CauseOfBlockage
        attr_reader :native

        def initialize(native = nil)
          @native = native
        end

        def short_description
          @native.getShortDescription
        end
      end

      class BecauseOfUpstreamBuildInProgress < Jenkins::Model::Queue::CauseOfBlockage
        attr_reader :native

        def initialize(native = nil)
          @native = native
        end

        def short_description
          @native.getShortDescription
        end
      end

      def cause_of_blockage
        @native.getCauseOfBlockage
      end

      def building_downstream
        @native.getBuildingDownstream
      end
      protected :building_downstream

      def building_upstream
        @native.getBuildingUpstream
      end
      protected :building_upstream

      def sub_tasks
        @native.getSubTasks
      end

      def create_executable
        @native.createExecutable
      end

      def check_abort_permission
        @native.checkAbortPermission
      end

      def has_abort_permission?
        @native.hasAbortPermission
      end

      def resource_list
        @native.getResourceList
      end

      def resource_activities
        @native.getResourceActivities
      end
      protected :resource_activities

      def checkout?(build, launcher, listener, changelog_file)
        @native.checkout(build, launcher, listener, changelog_file)
      end

      def poll(listener)
        @native.poll(listener)
      end

      def has_participant?(user)
        @native.hasParticipant(user)
      end

      def scm
        @native.getScm
      end

      def scm=(scm)
        @native.setScm(scm)
      end

      def add_trigger(trigger)
        @native.addTrigger(trigger)
      end

      def remove_trigger(trigger)
        @native.removeTrigger(trigger)
      end

      def add_to_list(item, collection)
        @native.addToList(item, collection)
      end
      protected :add_to_list

      def remove_from_list(item, collection)
        @native.removeFromList(item, collection)
      end
      protected :remove_from_list

      def triggers
        @native.getTriggers
      end

      def trigger(clazz)
        @native.getTrigger(clazz)
      end

      def downstream_projects
        @native.getDownstreamProjects
      end

      def upstream_projects
        @native.getUpstreamProjects
      end

      def build_trigger_upstream_projects
        @native.getBuildTriggerUpstreamProjects
      end

      def transitive_upstream_projects
        @native.getTransitiveUpstreamProjects
      end

      def transitive_downstream_projects
        @native.getTransitiveDownstreamProjects
      end

      def relationship(that)
        @native.getRelationship(that)
      end

      def make_search_index
        @native.makeSearchIndex
      end
      protected :make_search_index

      def create_history_widget
        @native.createHistoryWidget
      end
      protected :create_history_widget

      def parameterized?
        @native.isParameterized
      end

      def do_build(req, rsp)
        @native.doBuild(req, rsp)
      end

      def build_cause(req)
        @native.getBuildCause(req)
      end
      protected :build_cause

      def delay(req)
        @native.getDelay(req)
      end

      def do_build_with_parameters(req, rsp)
        @native.doBuildWithParameters(req, rsp)
      end

      def do_polling(req, rsp)
        @native.doPolling(req, rsp)
      end

      def do_cancel_queue(req, rsp)
        @native.doCancelQueue(req, rsp )
      end

      def submit(req, rsp)
        @native.submit(req, rsp)
      end
      protected :submit

      def build_describable(req, descriptors)
        @native.buildDescribable(req, descriptors)
      end
      protected :build_describable

      def do_ws(req, rsp)
        @native.doWs(req, rsp)
      end

      def do_do_wipe_out_workspace
        @native.doDoWipeOutWorkspace
      end

      def do_disable
        @native.doDisable
      end

      def do_enable
        @native.doEnable
      end

      def do_rss_changelog(req, rsp)
        @native.doRssChangelog(req, rsp  )
      end

      def find_nearest(name)
        @native.findNearest(name)
      end

      def resolve_for_cli(name)
        @native.resolveForCLI(name)
      end

      def custom_workspace
        @native.getCustomWorkspace
      end

      def custom_workspace=(custom_workspace)
        @native.setCustomWorkspace(custom_workspace)
      end
    end
  end
end
