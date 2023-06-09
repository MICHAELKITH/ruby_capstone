module Parser
  class << self
    def warn_syntax_deviation(feature, version)
      warn "warning: parser/current is loading #{feature}, which recognizes " \
           "#{version}-compliant syntax, but you are running #{RUBY_VERSION}.\n" \
           'Please see https://github.com/whitequark/parser#compatibility-with-ruby-mri.'
    end
    private :warn_syntax_deviation
  end

  case RUBY_VERSION
  when /^2\.0\./
    current_version = '2.0.0'
    warn_syntax_deviation 'parser/ruby20', current_version if current_version != RUBY_VERSION

    require 'parser/ruby20'
    CurrentRuby = Ruby20

  when /^2\.1\./
    current_version = '2.1.10'
    warn_syntax_deviation 'parser/ruby21', current_version if current_version != RUBY_VERSION

    require 'parser/ruby21'
    CurrentRuby = Ruby21

  when /^2\.2\./
    current_version = '2.2.10'
    warn_syntax_deviation 'parser/ruby22', current_version if current_version != RUBY_VERSION

    require 'parser/ruby22'
    CurrentRuby = Ruby22

  when /^2\.3\./
    current_version = '2.3.8'
    warn_syntax_deviation 'parser/ruby23', current_version if current_version != RUBY_VERSION

    require 'parser/ruby23'
    CurrentRuby = Ruby23

  when /^2\.4\./
    current_version = '2.4.10'
    warn_syntax_deviation 'parser/ruby24', current_version if current_version != RUBY_VERSION

    require 'parser/ruby24'
    CurrentRuby = Ruby24

  when /^2\.5\./
    current_version = '2.5.9'
    warn_syntax_deviation 'parser/ruby25', current_version if current_version != RUBY_VERSION

    require 'parser/ruby25'
    CurrentRuby = Ruby25

  when /^2\.6\./
    current_version = '2.6.10'
    warn_syntax_deviation 'parser/ruby26', current_version if current_version != RUBY_VERSION

    require 'parser/ruby26'
    CurrentRuby = Ruby26

  when /^2\.7\./
    current_version = '2.7.8'
    warn_syntax_deviation 'parser/ruby27', current_version if current_version != RUBY_VERSION

    require 'parser/ruby27'
    CurrentRuby = Ruby27

  when /^3\.0\./
    current_version = '3.0.6'
    warn_syntax_deviation 'parser/ruby30', current_version if current_version != RUBY_VERSION

    require 'parser/ruby30'
    CurrentRuby = Ruby30

  when /^3\.1\./
    current_version = '3.1.4'
    warn_syntax_deviation 'parser/ruby31', current_version if current_version != RUBY_VERSION

    require 'parser/ruby31'
    CurrentRuby = Ruby31

  when /^3\.2\./
    current_version = '3.2.2'
    warn_syntax_deviation 'parser/ruby32', current_version if current_version != RUBY_VERSION

    require 'parser/ruby32'
    CurrentRuby = Ruby32

  when /^3\.3\./
    current_version = '3.3.0-dev'
    warn_syntax_deviation 'parser/ruby33', current_version if current_version != RUBY_VERSION

    require 'parser/ruby33'
    CurrentRuby = Ruby33

  else # :nocov:
    # Keep this in sync with released Ruby.
    warn_syntax_deviation 'parser/ruby32', '3.2.x'
    require 'parser/ruby32'
    CurrentRuby = Ruby32
  end
end
