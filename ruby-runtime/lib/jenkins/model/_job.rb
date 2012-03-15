require 'jenkins/model/_abstract_item'

module Jenkins
  module Model
    class Job < AbstractItem

      attr_reader :native

      def initialize(native = nil)
        @native = native
      end

      def save
        @native.save
      end

      def on_load(parent, name)
        @native.onLoad(parent, name)
      end

      def on_copied_from(src)
        @native.onCopiedFrom(src)
      end

      def perform_delete
        @native.performDelete
      end
      protected :perform_delete

      def next_build_number_file
        @native.getNextBuildNumberFile
      end
      protected :next_build_number_file

      def hold_off_build_until_save?
        @native.isHoldOffBuildUntilSave
      end
      protected :hold_off_build_until_save?

      def save_next_build_number
        @native.saveNextBuildNumber
      end
      protected :save_next_build_number

      def in_queue?
        @native.isInQueue
      end
      protected :in_queue?

      def queue_item
        @native.getQueueItem
      end

      def building?
        @native.isBuilding
      end

      def pronoun
        @native.getPronoun
      end

      def name_editable?
        @native.isNameEditable
      end

      def keep_dependencies?
        @native.isKeepDependencies
      end

      def assign_build_number
        @native.assignBuildNumber
      end

      def next_build_number
        @native.getNextBuildNumber
      end

      def update_next_build_number(next_number)
        @native.updateNextBuildNumber(next_number)
      end

      def log_rotator
        @native.getLogRotator
      end

      def log_rotator=(log_rotator)
        @native.setLogRotator(log_rotator)
      end

      def log_rotate
        @native.logRotate
      end

      def supports_log_rotator?
        @native.supportsLogRotator
      end

      def make_search_index
        @native.makeSearchIndex
      end
      protected :make_search_index

      def all_jobs
        @native.getAllJobs
      end

      def add_property(job_prop)
        @native.addProperty(job_prop)
      end

      def remove_property(job_prop)
        @native.removeProperty(job_prop)
      end

      def properties
        @native.getProperties
      end

      def all_properties
        @native.getAllProperties
      end

      def property(arg)
        @native.getProperty(arg)
      end

      def overrides
        @native.getOverrides
      end

      def widgets
        @native.getWidgets
      end

      def create_history_widget
        @native.createHistoryWidget
      end

      def rename_to(new_name)
        @native.renameTo(new_name)
      end

      def builds(args)
        if args && args[0]
          @native.getBuilds(args[0])
        else
          @native.getBuilds
        end
      end

      def builds_as_map
        @native.getBuildsAsMap
      end

      def build_by_number(n)
        @native.getBuildByNumber(n)
      end

      def build_for_cli(id)
        @native.getBuildForCLI(id)
      end

      def nearest_build(n)
        @native.getNearestBuild(n)
      end

      def nearest_old_build(n)
        @native.getNearestOldBuild(n)
      end

      def dynamic(token, req, rsp)
        @native.getDynamic(token, req, rsp)
      end

      def build_dir
        @native.getBuildDir
      end
      protected :build_dir

      def last_build
        @native.getLastBuild
      end

      def first_build
        @native.getFirstBuild
      end

      def last_successful_build
        @native.getLastSuccessfulBuild
      end

      def last_unsuccessful_build
        @native.getLastUnsuccessfulBuild
      end

      def last_unstable_build
        @native.getLastUnstableBuild
      end

      def last_stable_build
        @native.getLastStableBuild
      end

      def last_failed_build
        @native.getLastFailedBuild
      end

      def last_completed_build
        @native.getLastCompletedBuild
      end

      def last_builds_over_threshold(number_of_builds, threshold)
        @native.getLastBuildsOverThreshold(number_of_builds, threshold)
      end

      def estimated_duration
        @native.getEstimatedDuration
      end

      def permalinks
        @native.getPermalinks
      end

      def icon_color
        @native.getIconColor
      end

      def build_health
        @native.getBuildHealth
      end

      def build_health_reports
        @native.getBuildHealthReports
      end

      def do_config_submit(req, rsp)
        @native.doConfigSubmit(req, rsp)
      end

      def submit(req, rsp)
        @native.submit(req, rsp)
      end
      protected :submit

      def do_description(req, rsp)
        @native.doDescription(req, rsp)
      end

      def do_build_status(req, rsp)
        @native.doBuildStatus(req, rsp)
      end

      def build_status_url
        @native.getBuildStatusUrl
      end

      def build_time_graph
        @native.getBuildTimeGraph
      end

      def do_do_rename(req, rsp)
        @native.doDoRename(req, rsp)
      end

      def do_rss_all(req, rsp)
        @native.doRssAll(req, rsp)
      end

      def do_rss_failed(req, rsp)
        @native.doRssFailed(req, rsp)
      end

      def acl
        @native.getACL
      end

      def timeline
        @native.getTimeline
      end

      Jenkins::Plugin::Proxies.register self, Java.hudson.model.Job
    end
  end
end