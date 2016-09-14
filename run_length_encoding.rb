class RunLengthEncoding
  def self.encode(str)
    coded = ""
    streak = 1
    (1..str.length).each do |idx|
      if str[idx] == str[idx - 1]
        streak += 1
      else
        coded << streak.to_s if streak > 1
        coded << str[idx - 1]
        streak = 1
      end
    end

    coded
  end

  def self.decode(coded_str)
    coded_bites = coded_str.scan(/\d*\D/)
    coded_bites.map do |bite|
      (num = bite[/\d+/]) ? bite[/\D/]*num.to_i : bite
    end.join
  end
end