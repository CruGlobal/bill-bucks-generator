# typed: strict
class ApplicationJob < ActiveJob::Base; end # discard_on ActiveJob::DeserializationError # Most jobs are safe to ignore if the underlying records are no longer available # retry_on ActiveRecord::Deadlocked # Automatically retry jobs that encountered a deadlock
