require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatsStat::Tracker do

  let(:tracker) { StatsStat::Tracker.new data_source }

  [:event, :now].to_objects {[
    [:the_special_event, Time.parse('2013/1/4')],
    [:another_event,     Time.parse('2013/1/4')],
    [:another_event,     Time.parse('2014/2/3')]
  ]}.each do |test|
    describe "with a valid data source" do

      let(:data_source) { mock() }

      describe "tracking an event" do

        before do
          Timecop.freeze test.now
          data_source.expects(:record_event).with(test.event, { created_at: test.now } )

          tracker.track test.event
        end 

        after { Timecop.return }

        it "should send the event to the data source" do
          # assertion set in mock above
        end
      end
    end
  end
end
