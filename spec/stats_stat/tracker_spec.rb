require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatsStat::Tracker do

  let(:tracker) { StatsStat::Tracker.new data_source }

  describe "with a valid data source" do

    let(:data_source) { mock() }

    describe "tracking an event" do

      let(:the_event) { :the_special_event }

      before do
        data_source.expects(:record_event).with(the_event)

        tracker.track the_event
      end 

      it "should send the event to the data source" do
        # assertion set in mock above
      end
    end
  end
end
