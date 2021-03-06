#- ©2009 Rick DeNatale, All rights reserved. Refer to the file README.txt for the license

require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

# RFC 2445 Section 4.3.9 pp 39-40
describe RiCal::PropertyValue::Period do
  
  before(:each) do
    @start_dt = RiCal::PropertyValue::DateTime.new(nil, :value => "19970101T180000Z")
    @end_dt = RiCal::PropertyValue::DateTime.new(nil, :value => "19970102T070000Z")
    @duration = RiCal::PropertyValue::Duration.from_datetimes(nil, @start_dt.to_datetime, @end_dt.to_datetime)
  end
  
  describe "with an explicit period" do
    before(:each) do
      @it = RiCal::PropertyValue::Period.new(nil, :value => "#{@start_dt.value}/#{@end_dt.value}")
    end
    
    it "should have the correct dtstart value" do
      @it.dtstart.should == @start_dt
    end
    
    it "should have the correct dtend value" do
      @it.dtend.should == @end_dt
    end
    
    it "should have the correct duration value" do
      @it.duration.should == @duration
    end
  end
  
  describe "with a start time and period" do
    before(:each) do
      @it = RiCal::PropertyValue::Period.new(nil, :value => "#{@start_dt.value}/#{@duration.value}")
    end
    
    it "should have the correct dtstart value" do
      @it.dtstart.should == @start_dt
    end
    
    it "should have the correct dtend value" do
      @it.dtend.should == @end_dt
    end
    
    it "should have the correct duration value" do
      @it.duration.should == @duration
    end
  end
end