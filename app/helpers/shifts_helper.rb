module ShiftsHelper
  def shift_file
    a = "public" + @shift.file.to_s
    f = File.new(a)
    lines = f.readlines
    require 'time'

    b = @shift.time
    s = false
    enc = 'a'

    lines.each_index do |n|
      if ! lines[n].valid_encoding?
        lines[n] = lines[n].encode("UTF-8", "Windows-1252")
        s = true
        enc = 'w:windows-1252'
      end
      if /\d\d:\d\d:\d\d,\d\d\d\s-->\s\d\d:\d\d:\d\d,\d\d\d/ === lines[n].chomp
        time = Time.parse(lines[n][0..7]) + b
        lines[n][0..7] = time.strftime('%H:%M:%S')
        time = Time.parse(lines[n][17..24]) + b
        lines[n][17..24] = time.strftime('%H:%M:%S')
      end
      if s == true
        lines[n] = lines[n].encode("Windows-1252", "UTF-8")
        s = false
      end
    end

    File.open(a, 'a') { |file| file.truncate(0) }
    File.open(a, enc) { |file| lines.each { |x| file.puts(x) } }
  end
end

