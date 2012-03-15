module Jenkins
  module Model
    class AbstractItem

      attr_reader :native

      def initialize(native = nil)
        @native = native
      end

      def on_created_from_scratch
        @native.onCreatedFromScratch
      end

      def name
        @native.getName()
      end

      def pronoun
        @native.getPronoun
      end

      def display_name
        @native.getDisplayName
      end

      def root_dir
        @native.getRootDir
      end

      def parent
        @native.getParent
      end

      def description
        @native.getDescription
      end

      def description=(description)
        @native.setDescription(description)
      end

      def do_set_name(name)
        @native.doSetName(name)
      end
      protected :do_set_name

      def rename_to(new_name)
        @native.renameTo(new_name)
      end
      protected :rename_to

      def full_name
        @native.getFullName
      end

      def full_display_name
        @native.getFullDisplayName
      end

      def on_load(parent, name)
        @native.onLoad(parent, name)
      end

      def on_copied_from(src)
        @native.onCopiedFrom(src)
      end

      def url
        @native.getUrl
      end

      def short_url
        @native.getShortUrl
      end

      def search_url
        @native.getSearchUrl
      end

      def absolute_url
        @native.getAbsoluteUrl
      end

      def api
        @native.getApi
      end

      def acl
        @native.getACL
      end

      def check_permission(permission)
        @native.checkPermission(permission)
      end

      def has_permission?
        @native.hasPermission
      end

      def save
        @native.save
      end

      def config_file
        @native.getConfigFile
      end

      def descriptor_by_name(class_name)
        @native.getDescriptorByName(class_name)
      end

      def do_submit_description(req, rsp)
        @native.doSubmitDescription(req, rsp)
      end

      def do_do_delete(req, rsp )
        @native.doDoDelete(req, rsp)
      end

      def delete(*args)
        if args && args.size == 2
          @native.delete(args[0], args[1])
        else
          @native.delete
        end
      end

      def perform_delete
        @native.performDelete
      end
      protected :perform_delete

      def do_config_dot_xml(req, rsp)
        @native.doConfigDotXml(req, rsp)
      end

      def to_s
        @native.toString
      end

      def resolve_for_cli(name)
        @native.resolveForCLI(name)
      end

      Jenkins::Plugin::Proxies.register self, Java.hudson.model.AbstractItem
    end
  end
end