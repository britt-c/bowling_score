class Player
  attr_accessor :name, :scores
  def initialize(name)
    @name = name
    @scores = []
  end

  def <<(points)
    @scores << points
  end

  def calc_scores
    @scores.inject(0) {|sum, n| sum + n}
    returns @scores.last
  end

  def count
    @scores.count
  end  
end  
  
  class Frame
   attr_accessor :roll1, :roll2
    def initialize(roll1, roll2)
      @roll1 = roll1
       @roll2 = roll2
    end

     def score_frame
      @scores << ( @roll1.to_i + @roll2.to_i )
     end 

     def strike 
       ( 10 + @score_frame.to_i + @scores.last.to_i)
    end
  end 




f = []

while f.count <= 9

  remaining_f = ( 10 - f.count)
  puts remaining_f.to_s + " frames remaining."

    puts "1st roll: "
    roll1 = gets.chomp
    if roll1 != "x" && roll1 != "/"
        if f.last == "/"
          f.pop
          f << (10 + roll1.to_i + f.last.to_i)
        end
      puts "Enter second roll: "
      roll2 = gets.chomp
      frame = ( roll1.to_i  + roll2.to_i )
        if f.last == "X"
          f.pop
          f << ( 10 + frame.to_i + f.last.to_i)
        end
       f << ( frame.to_i + f.last.to_i )
      puts f.join(",")
        if frame < 1  || frame > 9 
          puts " "
          puts "INVALID INPUT"
          puts "your entry: " +  frame.to_s
          f.pop
        end
    elsif roll1 == "x" || roll1 == "X"
        f << ( "X" )
        puts f.join(",")
        if f[9] == "X"
          f.pop
          puts "roll 3:"
          roll3 = gets.chomp
          puts "roll 4: "
          roll4 = gets.chomp
          f << (f.last.to_i + 10 + roll3.to_i + roll4.to_i)
          puts f.join(",") 
        end
    elsif roll1 == "/"
      f << ( "/" )
      puts f.join(",")
      if f[9] == "/"
        f.pop
        puts "roll 3:"
        roll3 = gets.chomp
        f << (f.last.to_i + 10 + roll3.to_i)
        puts f.join(",")
      end
    elsif roll1 == "-" 
      f << roll2 
    elsif roll2 == "-"
      f << roll1
    else
      exit
    end
end
f.inject(0) {|sum, n| sum + n}
puts f.last

