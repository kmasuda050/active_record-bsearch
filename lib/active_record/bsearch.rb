require "active_record/bsearch/version"
require "active_record"

module ActiveRecord
  module Bsearch
    extend ActiveSupport::Concern

    module ClassMethods
      # Binary search date with primary key
      #
      # @param [TimeWithZone] time search time
      # @param [Integer] min minimum primary key value
      # @param [Integer] max maximum primary key value
      # @param [String] column_name
      # @return [Integer] primary key value where column_name value between time and time.tomorrow
      # @return [nil] not found
      def bsearch(time, min: minimum(primary_key), max: maximum(primary_key), column_name: :created_at)
        id = (min..max).bsearch {|x|
          record = find_by(primary_key => x)
          if record.present?
            record.send(column_name) >= time
          else
            prev = find(where("#{primary_key} < ?", x).maximum(primary_key))
            prev.send(column_name) >= time
          end
        }
        (time...time.tomorrow).cover?(find_by(primary_key => id)&.send(column_name)) ? id : nil
      end
    end
  end
end
