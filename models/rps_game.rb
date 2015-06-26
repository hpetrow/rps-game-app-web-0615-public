class RPSGame
  attr_accessor :computer_play
  attr_reader :play
  VALID_PLAYS = [:rock, :paper, :scissors]

  def initialize(play)
    begin
      @play = play 
      raise PlayTypeError.new if !self.class.valid_play?(play)
    end
    @computer_play = VALID_PLAYS[rand(VALID_PLAYS.length-1)]
  end

  def self.valid_play?(play)
    VALID_PLAYS.include?(play)
  end

  def won?
    case self.play
    when :rock
      self.computer_play == :scissors
    when :paper
      self.computer_play == :rock
    when :scissors
      self.computer_play == :paper
    end
  end

  def tied?
    self.play == self.computer_play
  end

  def lost?
    case self.play
    when :rock
      self.computer_play == :paper
    when :paper
      self.computer_play == :scissors
    when :scissors
      self.computer_play == :rock
    end
  end

  class PlayTypeError < StandardError
  end
end
