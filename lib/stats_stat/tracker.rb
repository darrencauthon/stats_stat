module StatsStat
  class Tracker
    def initialize(data_source)
      @data_source = data_source
    end
    
    def track the_event
      @data_source.record_event the_event
    end
  end
end
