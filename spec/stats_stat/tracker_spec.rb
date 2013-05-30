require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatsStat::Tracker do

  let(:tracker) { StatsStat::Tracker.new data_source }

  [:event, :now].to_objects {[
    [:the_special_event, Time.parse('2013/1/4')],
    [:another_event,     Time.parse('2013/1/4')]
  ]}.each do |test|
    describe "with a valid data source" do

      let(:data_source) { mock() }

      describe "tracking an event" do

        before do
          data_source.expects(:record_event).with(test.event, { created_at: test.now } )

          tracker.track test.event
        end 

        it "should send the event to the data source" do
          # assertion set in mock above
        end
      end
    end
  end
end
