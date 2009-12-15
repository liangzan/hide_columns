require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "HideColumns" do

  before(:each) do
    @original_content_cols = [ mock_active_record("house"), mock_active_record("car"), mock_active_record("room"), mock_active_record("television") ]
    MockedModel.stubs(:content_columns).returns(@original_content_cols)
  end

  def mock_active_record(name)
    mock_active_record = mock()
    mock_active_record.stubs(:name).returns(name)
    mock_active_record
  end

  def hide_cols(cols)
    MockedModel.send(:hide_columns, cols)
  end

  def should_not_have_cols(hidden_cols)
    hidden_cols.each do |hidden_col|
      MockedModel.content_columns.each do |column|
        /^#{hidden_col}/.match(column.name).should be_nil
      end
    end
  end

  # Mocked Model will persist the hidden columns in the same set of specs
  it "should hide content columns if the selected column match exactly" do
    hidden_cols = %w(house car plane)
    hide_cols(hidden_cols)
    should_not_have_cols(hidden_cols)
  end

end
