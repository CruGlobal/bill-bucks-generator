# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `activejob` gem.
# Please instead update this file by running `bin/tapioca sync`.

# typed: true

module ActiveJob
  extend ::ActiveSupport::Autoload

  class << self
    def gem_version; end
    def version; end
  end
end

module ActiveJob::Arguments
  extend ::ActiveJob::Arguments

  def deserialize(arguments); end
  def serialize(arguments); end

  private

  def convert_to_global_id_hash(argument); end
  def custom_serialized?(hash); end
  def deserialize_argument(argument); end
  def deserialize_global_id(hash); end
  def deserialize_hash(serialized_hash); end
  def serialize_argument(argument); end
  def serialize_hash(argument); end
  def serialize_hash_key(key); end
  def serialize_indifferent_hash(indifferent_hash); end
  def serialized_global_id?(hash); end
  def transform_symbol_keys(hash, symbol_keys); end
end

ActiveJob::Arguments::GLOBALID_KEY = T.let(T.unsafe(nil), String)
ActiveJob::Arguments::OBJECT_SERIALIZER_KEY = T.let(T.unsafe(nil), String)
ActiveJob::Arguments::PERMITTED_TYPES = T.let(T.unsafe(nil), Array)
ActiveJob::Arguments::RESERVED_KEYS = T.let(T.unsafe(nil), Array)
ActiveJob::Arguments::RUBY2_KEYWORDS_KEY = T.let(T.unsafe(nil), String)
ActiveJob::Arguments::SYMBOL_KEYS_KEY = T.let(T.unsafe(nil), String)
ActiveJob::Arguments::WITH_INDIFFERENT_ACCESS_KEY = T.let(T.unsafe(nil), String)

class ActiveJob::Base
  extend ::ActiveJob::TestHelper::TestQueueAdapter::ClassMethods
  include ::ActiveJob::QueueAdapter
  include ::ActiveJob::QueueName
  include ::ActiveJob::QueuePriority
  include ::ActiveJob::Enqueuing
  include ::ActiveSupport::Rescuable
  include ::ActiveJob::Execution
  include ::ActiveSupport::Callbacks
  include ::ActiveJob::Callbacks
  include ::ActiveJob::Exceptions
  include ::ActiveJob::Logging
  include ::ActiveJob::Timezones
  include ::ActiveJob::Translation
  include ::ActiveJob::TestHelper::TestQueueAdapter
  extend ::ActiveJob::Core::ClassMethods
  extend ::ActiveJob::QueueAdapter::ClassMethods
  extend ::ActiveJob::QueueName::ClassMethods
  extend ::ActiveJob::QueuePriority::ClassMethods
  extend ::ActiveJob::Enqueuing::ClassMethods
  extend ::ActiveSupport::Rescuable::ClassMethods
  extend ::ActiveJob::Execution::ClassMethods
  extend ::ActiveSupport::Callbacks::ClassMethods
  extend ::ActiveSupport::DescendantsTracker
  extend ::ActiveJob::Callbacks::ClassMethods
  extend ::ActiveJob::Exceptions::ClassMethods
  include ::ActiveJob::Core

  def __callbacks; end
  def __callbacks?; end
  def _enqueue_callbacks; end
  def _perform_callbacks; end
  def _run_enqueue_callbacks(&block); end
  def _run_perform_callbacks(&block); end
  def logger; end
  def logger=(obj); end
  def rescue_handlers; end
  def rescue_handlers=(val); end
  def rescue_handlers?; end

  class << self
    def __callbacks; end
    def __callbacks=(val); end
    def __callbacks?; end
    def _enqueue_callbacks; end
    def _enqueue_callbacks=(value); end
    def _perform_callbacks; end
    def _perform_callbacks=(value); end
    def _queue_adapter; end
    def _queue_adapter=(val); end
    def _queue_adapter_name; end
    def _queue_adapter_name=(val); end
    def _test_adapter; end
    def _test_adapter=(val); end
    def logger; end
    def logger=(obj); end
    def priority; end
    def priority=(val); end
    def priority?; end
    def queue_name; end
    def queue_name=(val); end
    def queue_name?; end
    def queue_name_delimiter; end
    def queue_name_delimiter=(val); end
    def queue_name_delimiter?; end
    def rescue_handlers; end
    def rescue_handlers=(val); end
    def rescue_handlers?; end
    def return_false_on_aborted_enqueue; end
    def return_false_on_aborted_enqueue=(val); end
  end
end

module ActiveJob::Callbacks
  extend ::ActiveSupport::Concern
  extend ::ActiveSupport::Callbacks
  include ::ActiveSupport::Callbacks

  mixes_in_class_methods ::ActiveJob::Callbacks::ClassMethods

  class << self
    def __callbacks; end
    def __callbacks?; end
    def _execute_callbacks; end
    def _run_execute_callbacks(&block); end
  end
end

module ActiveJob::Callbacks::ClassMethods
  def after_enqueue(*filters, &blk); end
  def after_perform(*filters, &blk); end
  def around_enqueue(*filters, &blk); end
  def around_perform(*filters, &blk); end
  def before_enqueue(*filters, &blk); end
  def before_perform(*filters, &blk); end
end

class ActiveJob::ConfiguredJob
  def initialize(job_class, options = T.unsafe(nil)); end

  def perform_later(*args); end
  def perform_now(*args); end
end

module ActiveJob::Core
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveJob::Core::ClassMethods

  def initialize(*arguments); end

  def arguments; end
  def arguments=(_arg0); end
  def deserialize(job_data); end
  def enqueued_at; end
  def enqueued_at=(_arg0); end
  def exception_executions; end
  def exception_executions=(_arg0); end
  def executions; end
  def executions=(_arg0); end
  def job_id; end
  def job_id=(_arg0); end
  def locale; end
  def locale=(_arg0); end
  def priority=(_arg0); end
  def provider_job_id; end
  def provider_job_id=(_arg0); end
  def queue_name=(_arg0); end
  def scheduled_at; end
  def scheduled_at=(_arg0); end
  def serialize; end
  def serialized_arguments=(_arg0); end
  def timezone; end
  def timezone=(_arg0); end

  private

  def arguments_serialized?; end
  def deserialize_arguments(serialized_args); end
  def deserialize_arguments_if_needed; end
  def serialize_arguments(arguments); end
  def serialize_arguments_if_needed(arguments); end
end

module ActiveJob::Core::ClassMethods
  def deserialize(job_data); end
  def set(options = T.unsafe(nil)); end
end

class ActiveJob::DeserializationError < ::StandardError
  def initialize; end
end

module ActiveJob::Enqueuing
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveJob::Enqueuing::ClassMethods

  def enqueue(options = T.unsafe(nil)); end
end

module ActiveJob::Enqueuing::ClassMethods
  def perform_later(*args); end

  private

  def job_or_instantiate(*args); end
end

module ActiveJob::Exceptions
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveJob::Exceptions::ClassMethods

  def retry_job(options = T.unsafe(nil)); end

  private

  def determine_delay(seconds_or_duration_or_algorithm:, executions:); end
  def executions_for(exceptions); end
  def instrument(name, error: T.unsafe(nil), wait: T.unsafe(nil), &block); end
end

module ActiveJob::Exceptions::ClassMethods
  def discard_on(*exceptions); end
  def retry_on(*exceptions, wait: T.unsafe(nil), attempts: T.unsafe(nil), queue: T.unsafe(nil), priority: T.unsafe(nil)); end
end

module ActiveJob::Execution
  extend ::ActiveSupport::Concern
  include ::ActiveSupport::Rescuable

  mixes_in_class_methods ::ActiveJob::Execution::ClassMethods

  def perform(*_arg0); end
  def perform_now; end
end

module ActiveJob::Execution::ClassMethods
  def execute(job_data); end
  def perform_now(*args); end
end

module ActiveJob::Logging
  extend ::ActiveSupport::Concern

  private

  def logger_tagged_by_active_job?; end
  def tag_logger(*tags); end
end

class ActiveJob::Logging::LogSubscriber < ::ActiveSupport::LogSubscriber
  def discard(event); end
  def enqueue(event); end
  def enqueue_at(event); end
  def enqueue_retry(event); end
  def perform(event); end
  def perform_start(event); end
  def retry_stopped(event); end

  private

  def args_info(job); end
  def format(arg); end
  def logger; end
  def queue_name(event); end
  def scheduled_at(event); end
end

module ActiveJob::QueueAdapter
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveJob::QueueAdapter::ClassMethods
end

module ActiveJob::QueueAdapter::ClassMethods
  def queue_adapter; end
  def queue_adapter=(name_or_adapter); end
  def queue_adapter_name; end

  private

  def assign_adapter(adapter_name, queue_adapter); end
  def queue_adapter?(object); end
end

ActiveJob::QueueAdapter::ClassMethods::QUEUE_ADAPTER_METHODS = T.let(T.unsafe(nil), Array)

module ActiveJob::QueueAdapters
  extend ::ActiveSupport::Autoload

  class << self
    def lookup(name); end
  end
end

ActiveJob::QueueAdapters::ADAPTER = T.let(T.unsafe(nil), String)

class ActiveJob::QueueAdapters::AsyncAdapter
  def initialize(**executor_options); end

  def enqueue(job); end
  def enqueue_at(job, timestamp); end
  def immediate=(immediate); end
  def shutdown(wait: T.unsafe(nil)); end
end

class ActiveJob::QueueAdapters::AsyncAdapter::JobWrapper
  def initialize(job); end

  def perform; end
end

class ActiveJob::QueueAdapters::AsyncAdapter::Scheduler
  def initialize(**options); end

  def enqueue(job, queue_name:); end
  def enqueue_at(job, timestamp, queue_name:); end
  def executor; end
  def immediate; end
  def immediate=(_arg0); end
  def shutdown(wait: T.unsafe(nil)); end
end

ActiveJob::QueueAdapters::AsyncAdapter::Scheduler::DEFAULT_EXECUTOR_OPTIONS = T.let(T.unsafe(nil), Hash)

class ActiveJob::QueueAdapters::InlineAdapter
  def enqueue(job); end
  def enqueue_at(*_arg0); end
end

class ActiveJob::QueueAdapters::TestAdapter
  def enqueue(job); end
  def enqueue_at(job, timestamp); end
  def enqueued_jobs; end
  def enqueued_jobs=(_arg0); end
  def filter; end
  def filter=(_arg0); end
  def perform_enqueued_at_jobs; end
  def perform_enqueued_at_jobs=(_arg0); end
  def perform_enqueued_jobs; end
  def perform_enqueued_jobs=(_arg0); end
  def performed_jobs; end
  def performed_jobs=(_arg0); end
  def queue; end
  def queue=(_arg0); end
  def reject; end
  def reject=(_arg0); end

  private

  def filter_as_proc(filter); end
  def filtered?(job); end
  def filtered_job_class?(job); end
  def filtered_queue?(job); end
  def job_to_hash(job, extras = T.unsafe(nil)); end
  def perform_or_enqueue(perform, job, job_data); end
end

module ActiveJob::QueueName
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveJob::QueueName::ClassMethods

  def queue_name; end
end

module ActiveJob::QueueName::ClassMethods
  def default_queue_name; end
  def default_queue_name=(obj); end
  def queue_as(part_name = T.unsafe(nil), &block); end
  def queue_name_from_part(part_name); end
  def queue_name_prefix; end
  def queue_name_prefix=(obj); end

  class << self
    def default_queue_name; end
    def default_queue_name=(obj); end
    def queue_name_prefix; end
    def queue_name_prefix=(obj); end
  end
end

module ActiveJob::QueuePriority
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveJob::QueuePriority::ClassMethods

  def priority; end
end

module ActiveJob::QueuePriority::ClassMethods
  def default_priority; end
  def default_priority=(obj); end
  def queue_with_priority(priority = T.unsafe(nil), &block); end

  class << self
    def default_priority; end
    def default_priority=(obj); end
  end
end

class ActiveJob::Railtie < ::Rails::Railtie; end
class ActiveJob::SerializationError < ::ArgumentError; end

module ActiveJob::Serializers
  extend ::ActiveSupport::Autoload

  def _additional_serializers; end
  def _additional_serializers=(obj); end

  class << self
    def _additional_serializers; end
    def _additional_serializers=(obj); end
    def add_serializers(*new_serializers); end
    def deserialize(argument); end
    def serialize(argument); end
    def serializers; end
  end
end

class ActiveJob::Serializers::DateSerializer < ::ActiveJob::Serializers::ObjectSerializer
  def deserialize(hash); end
  def serialize(date); end

  private

  def klass; end
end

class ActiveJob::Serializers::DateTimeSerializer < ::ActiveJob::Serializers::ObjectSerializer
  def deserialize(hash); end
  def serialize(time); end

  private

  def klass; end
end

class ActiveJob::Serializers::DurationSerializer < ::ActiveJob::Serializers::ObjectSerializer
  def deserialize(hash); end
  def serialize(duration); end

  private

  def klass; end
end

class ActiveJob::Serializers::ObjectSerializer
  include ::Singleton
  extend ::Singleton::SingletonClassMethods

  def deserialize(_argument); end
  def serialize(hash); end
  def serialize?(argument); end

  private

  def klass; end

  class << self
    def deserialize(*_arg0, &_arg1); end
    def serialize(*_arg0, &_arg1); end
    def serialize?(*_arg0, &_arg1); end
  end
end

class ActiveJob::Serializers::SymbolSerializer < ::ActiveJob::Serializers::ObjectSerializer
  def deserialize(argument); end
  def serialize(argument); end

  private

  def klass; end
end

class ActiveJob::Serializers::TimeSerializer < ::ActiveJob::Serializers::ObjectSerializer
  def deserialize(hash); end
  def serialize(time); end

  private

  def klass; end
end

class ActiveJob::Serializers::TimeWithZoneSerializer < ::ActiveJob::Serializers::ObjectSerializer
  def deserialize(hash); end
  def serialize(time); end

  private

  def klass; end
end

class ActiveJob::TestCase < ::ActiveSupport::TestCase
  include ::ActiveJob::TestHelper
end

module ActiveJob::TestHelper
  def after_teardown; end
  def assert_enqueued_jobs(number, only: T.unsafe(nil), except: T.unsafe(nil), queue: T.unsafe(nil)); end
  def assert_enqueued_with(job: T.unsafe(nil), args: T.unsafe(nil), at: T.unsafe(nil), queue: T.unsafe(nil)); end
  def assert_no_enqueued_jobs(only: T.unsafe(nil), except: T.unsafe(nil), queue: T.unsafe(nil), &block); end
  def assert_no_performed_jobs(only: T.unsafe(nil), except: T.unsafe(nil), queue: T.unsafe(nil), &block); end
  def assert_performed_jobs(number, only: T.unsafe(nil), except: T.unsafe(nil), queue: T.unsafe(nil), &block); end
  def assert_performed_with(job: T.unsafe(nil), args: T.unsafe(nil), at: T.unsafe(nil), queue: T.unsafe(nil), &block); end
  def before_setup; end
  def enqueued_jobs(*_arg0, &_arg1); end
  def enqueued_jobs=(arg); end
  def perform_enqueued_jobs(only: T.unsafe(nil), except: T.unsafe(nil), queue: T.unsafe(nil)); end
  def performed_jobs(*_arg0, &_arg1); end
  def performed_jobs=(arg); end
  def queue_adapter; end
  def queue_adapter_for_test; end

  private

  def clear_enqueued_jobs; end
  def clear_performed_jobs; end
  def deserialize_args_for_assertion(job); end
  def enqueued_jobs_with(only: T.unsafe(nil), except: T.unsafe(nil), queue: T.unsafe(nil), &block); end
  def filter_as_proc(filter); end
  def flush_enqueued_jobs(only: T.unsafe(nil), except: T.unsafe(nil), queue: T.unsafe(nil)); end
  def instantiate_job(payload); end
  def jobs_with(jobs, only: T.unsafe(nil), except: T.unsafe(nil), queue: T.unsafe(nil)); end
  def performed_jobs_with(only: T.unsafe(nil), except: T.unsafe(nil), queue: T.unsafe(nil), &block); end
  def prepare_args_for_assertion(args); end
  def queue_adapter_changed_jobs; end
  def round_time_arguments(argument); end
  def validate_option(only: T.unsafe(nil), except: T.unsafe(nil)); end
end

module ActiveJob::TestHelper::TestQueueAdapter
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveJob::TestHelper::TestQueueAdapter::ClassMethods
end

module ActiveJob::TestHelper::TestQueueAdapter::ClassMethods
  def disable_test_adapter; end
  def enable_test_adapter(test_adapter); end
  def queue_adapter; end
end

module ActiveJob::Timezones
  extend ::ActiveSupport::Concern
end

module ActiveJob::Translation
  extend ::ActiveSupport::Concern
end

module ActiveJob::VERSION; end
ActiveJob::VERSION::MAJOR = T.let(T.unsafe(nil), Integer)
ActiveJob::VERSION::MINOR = T.let(T.unsafe(nil), Integer)
ActiveJob::VERSION::PRE = T.let(T.unsafe(nil), String)
ActiveJob::VERSION::STRING = T.let(T.unsafe(nil), String)
ActiveJob::VERSION::TINY = T.let(T.unsafe(nil), Integer)
