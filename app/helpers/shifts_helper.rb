module ShiftsHelper
  def shift_file
    a = "public" + @shift.file.to_s
    f = File.new(a)
    lines = f.readlines
    require 'time'

    b = @shift.time

    lines.each_index do |n|
      if /\d\d:\d\d:\d\d,\d\d\d\s-->\s\d\d:\d\d:\d\d,\d\d\d/ === lines[n].chomp
        time = Time.parse(lines[n][0..7]) + b
        lines[n][0..7] = time.strftime('%H:%M:%S')
        time = Time.parse(lines[n][17..24]) + b
        lines[n][17..24] = time.strftime('%H:%M:%S')
      end
    end

    @shift.result = @shift.file.to_s.chomp(".srt") + "_new.srt"
    a = "public" + @shift.result.to_s
    # a = "public" + @shift.file.to_s
    File.open(a, 'a') { |file| lines.each { |x| file.puts(x) } }
  end
end

