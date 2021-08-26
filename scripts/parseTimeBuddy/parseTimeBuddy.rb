#!/usr/bin/env ruby

text =""
STDIN.each {|line| text = "#{text}" + line}
cal = Hash.new
prevLine = ""
text.split("\n").each do |line|
    next if (line =~ /^Scheduled with/)
    next if (line =~ /^$/)
    if (line =~ /^[a-zA-Z]/) then
        line = line.split(",")[0]
        cal[line] = []
        prevLine = line
    else
        cal[prevLine] << line
    end
end

head = cal.keys()
printf("| ### %-20s | ### %-20s | ### %-20s | ### %-20s |\n", head[0], head[1], head[2], head[3])
printf("| %-24s | %-24s | %-24s | %-24s |\n", "-" * 24, "-" * 24, "-" * 24, "-" * 24)

time = cal.values
printf("| %-24s | %-24s | %-24s | %-24s |\n", time[0][0], time[1][0], time[2][0], time[3][0])
printf("| %-24s | %-24s | %-24s | %-24s |\n", time[0][1], time[1][1], time[2][1], time[3][1])
