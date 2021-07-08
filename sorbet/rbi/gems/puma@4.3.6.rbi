# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `puma` gem.
# Please instead update this file by running `bin/tapioca sync`.

# typed: true

module Puma
  class << self
    def set_thread_name(name); end
    def stats; end
    def stats_object=(val); end
  end
end

class Puma::Binder
  include ::Puma::Const

  def initialize(events); end

  def add_ssl_listener(host, port, ctx, optimize_for_latency = T.unsafe(nil), backlog = T.unsafe(nil)); end
  def add_tcp_listener(host, port, optimize_for_latency = T.unsafe(nil), backlog = T.unsafe(nil)); end
  def add_unix_listener(path, umask = T.unsafe(nil), mode = T.unsafe(nil), backlog = T.unsafe(nil)); end
  def close; end
  def close_listeners; end
  def close_unix_paths; end
  def connected_port; end
  def env(sock); end
  def import_from_env; end
  def inherit_ssl_listener(fd, ctx); end
  def inherit_tcp_listener(host, port, fd); end
  def inherit_unix_listener(path, fd); end
  def ios; end
  def loopback_addresses; end
  def parse(binds, logger); end
  def redirects_for_restart; end
end

Puma::Binder::RACK_VERSION = T.let(T.unsafe(nil), Array)

class Puma::Client
  include ::Puma::Const
  extend ::Forwardable

  def initialize(io, env = T.unsafe(nil)); end

  def body; end
  def call; end
  def close; end
  def closed?(*args, &block); end
  def eagerly_finish; end
  def env; end
  def finish; end
  def hijacked; end
  def in_data_phase; end
  def inspect; end
  def io; end
  def peerip; end
  def peerip=(_arg0); end
  def ready; end
  def remote_addr_header; end
  def remote_addr_header=(_arg0); end
  def reset(fast_check = T.unsafe(nil)); end
  def set_timeout(val); end
  def tempfile; end
  def timeout_at; end
  def to_io; end
  def try_to_finish; end
  def write_error(status_code); end

  private

  def decode_chunk(chunk); end
  def read_body; end
  def read_chunked_body; end
  def set_ready; end
  def setup_body; end
  def setup_chunked_body(body); end
end

Puma::Client::EmptyBody = T.let(T.unsafe(nil), Puma::NullIO)

class Puma::Cluster < ::Puma::Runner
  def initialize(cli, events); end

  def all_workers_booted?; end
  def check_workers(force = T.unsafe(nil)); end
  def cull_workers; end
  def halt; end
  def next_worker_index; end
  def phased_restart; end
  def preload?; end
  def redirect_io; end
  def reload_worker_directory; end
  def restart; end
  def run; end
  def setup_signals; end
  def spawn_workers; end
  def start_phased_restart; end
  def stats; end
  def stop; end
  def stop_blocked; end
  def stop_workers; end
  def wakeup!; end
  def worker(index, master); end

  private

  def wait_workers; end
end

class Puma::Cluster::Worker
  def initialize(idx, pid, phase, options); end

  def boot!; end
  def booted?; end
  def hup; end
  def index; end
  def kill; end
  def last_checkin; end
  def last_status; end
  def phase; end
  def pid; end
  def ping!(status); end
  def ping_timeout?(which); end
  def signal; end
  def started_at; end
  def term; end
  def term?; end
end

class Puma::ConnectionError < ::RuntimeError; end
module Puma::Const; end
Puma::Const::CGI_VER = T.let(T.unsafe(nil), String)
Puma::Const::CHUNKED = T.let(T.unsafe(nil), String)
Puma::Const::CHUNK_SIZE = T.let(T.unsafe(nil), Integer)
Puma::Const::CLOSE = T.let(T.unsafe(nil), String)
Puma::Const::CLOSE_CHUNKED = T.let(T.unsafe(nil), String)
Puma::Const::CODE_NAME = T.let(T.unsafe(nil), String)
Puma::Const::COLON = T.let(T.unsafe(nil), String)
Puma::Const::CONNECTION_CLOSE = T.let(T.unsafe(nil), String)
Puma::Const::CONNECTION_KEEP_ALIVE = T.let(T.unsafe(nil), String)
Puma::Const::CONTENT_LENGTH = T.let(T.unsafe(nil), String)
Puma::Const::CONTENT_LENGTH2 = T.let(T.unsafe(nil), String)
Puma::Const::CONTENT_LENGTH_S = T.let(T.unsafe(nil), String)
Puma::Const::CONTINUE = T.let(T.unsafe(nil), String)
Puma::Const::EARLY_HINTS = T.let(T.unsafe(nil), String)
Puma::Const::ERROR_RESPONSE = T.let(T.unsafe(nil), Hash)
Puma::Const::FAST_TRACK_KA_TIMEOUT = T.let(T.unsafe(nil), Float)
Puma::Const::FIRST_DATA_TIMEOUT = T.let(T.unsafe(nil), Integer)
Puma::Const::GATEWAY_INTERFACE = T.let(T.unsafe(nil), String)
Puma::Const::HALT_COMMAND = T.let(T.unsafe(nil), String)
Puma::Const::HEAD = T.let(T.unsafe(nil), String)
Puma::Const::HIJACK = T.let(T.unsafe(nil), String)
Puma::Const::HIJACK_IO = T.let(T.unsafe(nil), String)
Puma::Const::HIJACK_P = T.let(T.unsafe(nil), String)
Puma::Const::HTTP = T.let(T.unsafe(nil), String)
Puma::Const::HTTPS = T.let(T.unsafe(nil), String)
Puma::Const::HTTPS_KEY = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_10_200 = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_11 = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_11_100 = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_11_200 = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_CONNECTION = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_EXPECT = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_HOST = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_INJECTION_REGEX = T.let(T.unsafe(nil), Regexp)
Puma::Const::HTTP_VERSION = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_X_FORWARDED_FOR = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_X_FORWARDED_PROTO = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_X_FORWARDED_SCHEME = T.let(T.unsafe(nil), String)
Puma::Const::HTTP_X_FORWARDED_SSL = T.let(T.unsafe(nil), String)
Puma::Const::KEEP_ALIVE = T.let(T.unsafe(nil), String)
Puma::Const::LINE_END = T.let(T.unsafe(nil), String)
Puma::Const::LOCALHOST = T.let(T.unsafe(nil), String)
Puma::Const::LOCALHOST_ADDR = T.let(T.unsafe(nil), String)
Puma::Const::LOCALHOST_IP = T.let(T.unsafe(nil), String)
Puma::Const::MAX_BODY = T.let(T.unsafe(nil), Integer)
Puma::Const::MAX_FAST_INLINE = T.let(T.unsafe(nil), Integer)
Puma::Const::MAX_HEADER = T.let(T.unsafe(nil), Integer)
Puma::Const::NEWLINE = T.let(T.unsafe(nil), String)
Puma::Const::PATH_INFO = T.let(T.unsafe(nil), String)
Puma::Const::PERSISTENT_TIMEOUT = T.let(T.unsafe(nil), Integer)
Puma::Const::PORT_443 = T.let(T.unsafe(nil), String)
Puma::Const::PORT_80 = T.let(T.unsafe(nil), String)
Puma::Const::PUMA_CONFIG = T.let(T.unsafe(nil), String)
Puma::Const::PUMA_PEERCERT = T.let(T.unsafe(nil), String)
Puma::Const::PUMA_SERVER_STRING = T.let(T.unsafe(nil), String)
Puma::Const::PUMA_SOCKET = T.let(T.unsafe(nil), String)
Puma::Const::PUMA_TMP_BASE = T.let(T.unsafe(nil), String)
Puma::Const::PUMA_VERSION = T.let(T.unsafe(nil), String)
Puma::Const::QUERY_STRING = T.let(T.unsafe(nil), String)
Puma::Const::RACK_AFTER_REPLY = T.let(T.unsafe(nil), String)
Puma::Const::RACK_INPUT = T.let(T.unsafe(nil), String)
Puma::Const::RACK_URL_SCHEME = T.let(T.unsafe(nil), String)
Puma::Const::REMOTE_ADDR = T.let(T.unsafe(nil), String)
Puma::Const::REQUEST_METHOD = T.let(T.unsafe(nil), String)
Puma::Const::REQUEST_PATH = T.let(T.unsafe(nil), String)
Puma::Const::REQUEST_URI = T.let(T.unsafe(nil), String)
Puma::Const::RESTART_COMMAND = T.let(T.unsafe(nil), String)
Puma::Const::SERVER_NAME = T.let(T.unsafe(nil), String)
Puma::Const::SERVER_PORT = T.let(T.unsafe(nil), String)
Puma::Const::SERVER_PROTOCOL = T.let(T.unsafe(nil), String)
Puma::Const::SERVER_SOFTWARE = T.let(T.unsafe(nil), String)
Puma::Const::STOP_COMMAND = T.let(T.unsafe(nil), String)
Puma::Const::TRANSFER_ENCODING = T.let(T.unsafe(nil), String)
Puma::Const::TRANSFER_ENCODING2 = T.let(T.unsafe(nil), String)
Puma::Const::TRANSFER_ENCODING_CHUNKED = T.let(T.unsafe(nil), String)
Puma::Const::VERSION = T.let(T.unsafe(nil), String)
Puma::Const::WORKER_CHECK_INTERVAL = T.let(T.unsafe(nil), Integer)
Puma::Const::WRITE_TIMEOUT = T.let(T.unsafe(nil), Integer)

class Puma::Events
  include ::Puma::Const

  def initialize(stdout, stderr); end

  def debug(str); end
  def error(str); end
  def fire(hook, *args); end
  def fire_on_booted!; end
  def format(str); end
  def formatter; end
  def formatter=(_arg0); end
  def log(str); end
  def on_booted(&block); end
  def parse_error(server, env, error); end
  def register(hook, obj = T.unsafe(nil), &blk); end
  def ssl_error(server, peeraddr, peercert, error); end
  def stderr; end
  def stdout; end
  def unknown_error(server, error, kind = T.unsafe(nil), env = T.unsafe(nil)); end
  def write(str); end

  class << self
    def null; end
    def stdio; end
    def strings; end
  end
end

Puma::Events::DEFAULT = T.let(T.unsafe(nil), Puma::Events)

class Puma::Events::DefaultFormatter
  def call(str); end
end

class Puma::Events::PidFormatter
  def call(str); end
end

Puma::HTTP_STATUS_CODES = T.let(T.unsafe(nil), Hash)

class Puma::Launcher
  def initialize(conf, launcher_args = T.unsafe(nil)); end

  def binder; end
  def close_binder_listeners; end
  def config; end
  def connected_port; end
  def delete_pidfile; end
  def events; end
  def halt; end
  def options; end
  def phased_restart; end
  def restart; end
  def restart_args; end
  def restart_dir; end
  def run; end
  def stats; end
  def stop; end
  def write_state; end

  private

  def clustered?; end
  def dependencies_and_files_to_require_after_prune; end
  def environment; end
  def extra_runtime_deps_directories; end
  def generate_restart_data; end
  def graceful_stop; end
  def log(str); end
  def log_thread_status; end
  def prune_bundler; end
  def prune_bundler?; end
  def puma_wild_location; end
  def reload_worker_directory; end
  def require_paths_for_gem(gem_spec); end
  def require_rubygems_min_version!(min_version, feature); end
  def restart!; end
  def set_process_title; end
  def set_rack_environment; end
  def setup_signals; end
  def spec_for_gem(gem_name); end
  def title; end
  def unsupported(str); end
  def write_pid; end
end

Puma::Launcher::KEYS_NOT_TO_PERSIST_IN_STATE = T.let(T.unsafe(nil), Array)

module Puma::MiniSSL
  class << self
    def check; end
  end
end

class Puma::MiniSSL::Context
  def initialize; end

  def ca; end
  def ca=(ca); end
  def cert; end
  def cert=(cert); end
  def check; end
  def key; end
  def key=(key); end
  def no_tlsv1; end
  def no_tlsv1=(tlsv1); end
  def no_tlsv1_1; end
  def no_tlsv1_1=(tlsv1_1); end
  def ssl_cipher_filter; end
  def ssl_cipher_filter=(_arg0); end
  def verify_mode; end
  def verify_mode=(_arg0); end
end

class Puma::MiniSSL::ContextBuilder
  def initialize(params, events); end

  def context; end

  private

  def events; end
  def params; end
end

class Puma::MiniSSL::Engine
  def extract; end
  def init?; end
  def inject(_arg0); end
  def peercert; end
  def read; end
  def shutdown; end
  def write(_arg0); end

  class << self
    def client; end
    def server(_arg0); end
  end
end

Puma::MiniSSL::OPENSSL_LIBRARY_VERSION = T.let(T.unsafe(nil), String)
Puma::MiniSSL::OPENSSL_NO_SSL3 = T.let(T.unsafe(nil), TrueClass)
Puma::MiniSSL::OPENSSL_VERSION = T.let(T.unsafe(nil), String)
class Puma::MiniSSL::SSLError < ::StandardError; end

class Puma::MiniSSL::Server
  def initialize(socket, ctx); end

  def accept; end
  def accept_nonblock; end
  def close; end
  def to_io; end
end

class Puma::MiniSSL::Socket
  def initialize(socket, engine); end

  def <<(data); end
  def close; end
  def closed?; end
  def engine_read_all; end
  def flush; end
  def peeraddr; end
  def peercert; end
  def read_and_drop(timeout = T.unsafe(nil)); end
  def read_nonblock(size, *_); end
  def readpartial(size); end
  def should_drop_bytes?; end
  def syswrite(data); end
  def to_io; end
  def write(data); end
  def write_nonblock(data, *_); end
end

Puma::MiniSSL::VERIFY_FAIL_IF_NO_PEER_CERT = T.let(T.unsafe(nil), Integer)
Puma::MiniSSL::VERIFY_NONE = T.let(T.unsafe(nil), Integer)
Puma::MiniSSL::VERIFY_PEER = T.let(T.unsafe(nil), Integer)

class Puma::NullIO
  def close; end
  def each; end
  def eof?; end
  def gets; end
  def puts(*ary); end
  def read(count = T.unsafe(nil), _buffer = T.unsafe(nil)); end
  def rewind; end
  def size; end
  def sync=(v); end
  def write(*ary); end
end

class Puma::Plugin
  def initialize(loader); end

  def in_background(&blk); end
  def workers_supported?; end

  class << self
    def create(&blk); end
    def extract_name(ary); end
  end
end

Puma::Plugin::CALLER_FILE = T.let(T.unsafe(nil), Regexp)

class Puma::PluginLoader
  def initialize; end

  def create(name); end
  def fire_starts(launcher); end
end

class Puma::PluginRegistry
  def initialize; end

  def add_background(blk); end
  def find(name); end
  def fire_background; end
  def register(name, cls); end
end

Puma::Plugins = T.let(T.unsafe(nil), Puma::PluginRegistry)

class Puma::Reactor
  def initialize(server, app_pool); end

  def add(c); end
  def calculate_sleep; end
  def clear!; end
  def run; end
  def run_in_thread; end
  def shutdown; end

  private

  def clear_monitor(mon); end
  def run_internal; end
end

Puma::Reactor::DefaultSleepFor = T.let(T.unsafe(nil), Integer)

class Puma::Runner
  def initialize(cli, events); end

  def app; end
  def before_restart; end
  def daemon?; end
  def debug(str); end
  def development?; end
  def error(str); end
  def load_and_bind; end
  def log(str); end
  def output_header(mode); end
  def redirect_io; end
  def redirected_io?; end
  def ruby_engine; end
  def start_control; end
  def start_server; end
  def test?; end
end

Puma::STATUS_WITH_NO_ENTITY_BODY = T.let(T.unsafe(nil), Hash)

class Puma::Server
  include ::Puma::Const
  extend ::Forwardable

  def initialize(app, events = T.unsafe(nil), options = T.unsafe(nil)); end

  def add_ssl_listener(*args, &block); end
  def add_tcp_listener(*args, &block); end
  def add_unix_listener(*args, &block); end
  def app; end
  def app=(_arg0); end
  def auto_trim_time; end
  def auto_trim_time=(_arg0); end
  def backlog; end
  def begin_restart; end
  def binder; end
  def binder=(_arg0); end
  def closed_socket?(socket); end
  def connected_port(*args, &block); end
  def cork_socket(socket); end
  def default_server_port(env); end
  def early_hints; end
  def early_hints=(_arg0); end
  def events; end
  def first_data_timeout; end
  def first_data_timeout=(_arg0); end
  def graceful_shutdown; end
  def halt(sync = T.unsafe(nil)); end
  def handle_check; end
  def handle_request(req, lines); end
  def handle_servers; end
  def handle_servers_lopez_mode; end
  def inherit_binder(bind); end
  def leak_stack_on_error; end
  def leak_stack_on_error=(_arg0); end
  def lowlevel_error(e, env); end
  def max_threads; end
  def max_threads=(_arg0); end
  def min_threads; end
  def min_threads=(_arg0); end
  def normalize_env(env, client); end
  def persistent_timeout; end
  def persistent_timeout=(_arg0); end
  def pool_capacity; end
  def process_client(client, buffer); end
  def read_body(env, client, body, cl); end
  def reaping_time; end
  def reaping_time=(_arg0); end
  def run(background = T.unsafe(nil)); end
  def run_lopez_mode(background = T.unsafe(nil)); end
  def running; end
  def shutting_down?; end
  def stop(sync = T.unsafe(nil)); end
  def tcp_mode!; end
  def thread; end
  def uncork_socket(socket); end

  private

  def fast_write(io, str); end
  def fetch_status_code(status); end
  def notify_safely(message); end
  def possible_header_injection?(header_value); end

  class << self
    def current; end
  end
end

Puma::Server::ThreadLocalKey = T.let(T.unsafe(nil), Symbol)

class Puma::Single < ::Puma::Runner
  def halt; end
  def jruby_daemon?; end
  def jruby_daemon_start; end
  def restart; end
  def run; end
  def stats; end
  def stop; end
  def stop_blocked; end
end

class Puma::ThreadPool
  def initialize(min, max, *extra, &block); end

  def <<(work); end
  def auto_reap!(timeout = T.unsafe(nil)); end
  def auto_trim!(timeout = T.unsafe(nil)); end
  def backlog; end
  def clean_thread_locals; end
  def clean_thread_locals=(_arg0); end
  def pool_capacity; end
  def reap; end
  def shutdown(timeout = T.unsafe(nil)); end
  def spawned; end
  def trim(force = T.unsafe(nil)); end
  def trim_requested; end
  def wait_until_not_full; end
  def waiting; end

  private

  def spawn_thread; end

  class << self
    def clean_thread_locals; end
  end
end

class Puma::ThreadPool::Automaton
  def initialize(pool, timeout, thread_name, message); end

  def start!; end
  def stop; end
end

class Puma::ThreadPool::ForceShutdown < ::RuntimeError; end
Puma::ThreadPool::SHUTDOWN_GRACE_TIME = T.let(T.unsafe(nil), Integer)
class Puma::UnknownPlugin < ::RuntimeError; end
class Puma::UnsupportedOption < ::RuntimeError; end

module Puma::Util
  private

  def parse_query(qs, d = T.unsafe(nil), &unescaper); end
  def pipe; end
  def unescape(s, encoding = T.unsafe(nil)); end

  class << self
    def parse_query(qs, d = T.unsafe(nil), &unescaper); end
    def pipe; end
    def unescape(s, encoding = T.unsafe(nil)); end
  end
end

Puma::Util::DEFAULT_SEP = T.let(T.unsafe(nil), Regexp)

class Puma::Util::HeaderHash < ::Hash
  def initialize(hash = T.unsafe(nil)); end

  def [](k); end
  def []=(k, v); end
  def delete(k); end
  def each; end
  def has_key?(k); end
  def include?(k); end
  def key?(k); end
  def member?(k); end
  def merge(other); end
  def merge!(other); end
  def replace(other); end
  def to_hash; end

  class << self
    def new(hash = T.unsafe(nil)); end
  end
end
