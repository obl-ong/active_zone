# Copyright (c) David Heinemeier Hansson
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Code redistributed from Active Storage (https://github.com/rails/rails/blob/6e7ef7d61c7146ca03b173abc32f7ed97e3d949a/activestorage/lib/active_storage/service/configurator.rb)

# frozen_string_literal: true

module ActiveZone
  class Provider::Configurator # :nodoc:
    attr_reader :configurations

    def self.build(provider_name, configurations)
      new(configurations).build(provider_name)
    end

    def initialize(configurations)
      @configurations = configurations.deep_symbolize_keys
    end

    def build(provider_name)
      config = config_for(provider_name.to_sym)
      resolve(config.fetch(:provider)).build(
        **config, configurator: self, name: provider_name
      )
    end

    private

    def config_for(name)
      configurations.fetch name do
        raise "Missing configuration for the #{name.inspect} Active Zone provider. Configurations available for #{configurations.keys.inspect}"
      end
    end

    def resolve(class_name)
      require "active_zone/provider/#{class_name.to_s.underscore}_provider"
      ActiveZone::Provider.const_get(:"#{class_name.camelize}Provider")
    rescue LoadError
      raise "Missing provider adapter for #{class_name.inspect}"
    end
  end
end
