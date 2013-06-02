module StatsStat
  class Tracker
    def initialize(data_source)
      @data_source = data_source
    end
    
    def track(the_event, the_data = nil)
      unless(the_data.nil?)
        @data_source.record_event(the_event, { :created_at => Time.now, :data => the_data } )
      else
        @data_source.record_event(the_event, { :created_at => Time.now } )
      end
    end
  end
end
