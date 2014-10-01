module Uber
  class Stats
    attr_reader :stats

    def initialize
      @stats = Hash.new { |hsh, k| hsh[k] = 0 }
    end

    def process_history(history)
      if history.size > 1
        total_w_time = history.inject(0) { |sum, t| sum + (t["request_time"] - t["start_time"]).abs }
        stats[:avg_w_time] = (total_w_time / history.size) / 60
        stats[:avg_miles] = (history.inject(0) { |sum, t| sum + t["distance"] } / history.size).round(2)
      end
    end
  end
end
