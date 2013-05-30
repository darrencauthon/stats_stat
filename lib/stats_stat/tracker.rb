module StatsStat
  class Tracker
    def initialize(data_source)
      @data_source = data_source
    end
    
    def track the_event
      @data_source.record_event(the_event, { :created_at => Time.parse('2013/1/4') } )
    end
  end
end
