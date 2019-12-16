require "spec_helper"
require_relative "../bowling.rb"

describe "score_frame" do
 it "adds two scores" do
    @roll1 = 3
    @roll2 = 4
    expected = 7
    actual = sum(@roll1, @roll2)
    expect(actual).to eq(expected)
 end
end 

describe "calc_score" do 
  it "adds all the scores in the completed array" do
    @scores = [7,15,23,29,45,51,64,70,76,82]
    expected = 82
    actual = @scores.inject(0) {|sum, n| sum + n}
             @scores.last
    expect(actual).to eq(expected)
  end
end

describe "strike" do 
  it "add three scores" do
    @score_frame = 7
    @score.last = 6
    actual = ( 10 + @score_frame.to_i + @scores.last.to_i)
    expect(actual).to eq(expected)
  end
end
