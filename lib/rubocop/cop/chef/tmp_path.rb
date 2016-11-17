#
# Copyright 2016, Chris Henry
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module RuboCop
  module Cop
    module Chef
      # Use file_cache_path rather than hard-coding tmp paths
      #
      # @example downloading a large file into /tmp/
      #
      #   # bad
      #   remote_file '/tmp/large-file.tar.gz' do
      #
      class TmpPath < Cop

        MSG = 'Use file_cache_path rather than hard-coding tmp paths'.freeze

        def_node_matcher :remote_file?, <<-PATTERN
          (send nil :remote_file $str)
        PATTERN

        def on_send(node)
          puts "on send"
          puts node
          remote_file?(node) do |command|
            print command
            if has_hardcoded_tmp?(command)
              puts "found it"
              add_offense(command, :expression, MSG, :error)
            end
          end
        end

        def has_hardcoded_tmp?(path)
          puts "has_hardcoded_tmp"
          puts path.to_s
          puts path.to_s.start_with?("/tmp/")
          path.to_s.start_with?("/tmp/")
        end

      end
    end
  end
end
