class ActiveSupport::BufferedLogger

  def formatter=(formatter)
    @log.formatter = formatter
  end

end

class Formatter
  SEVERITY_TO_TAG_MAP     = {'DEBUG'=>'DB_QUERY', 'INFO'=>'INFO', 'WARN'=>'WARNING', 'ERROR'=>'ERROR', 'FATAL'=>'ERROR', 'UNKNOWN'=>'???'}
  SEVERITY_TO_COLOR_MAP   = {'DEBUG'=>'0;37', 'INFO'=>'32', 'WARN'=>'33', 'ERROR'=>'31', 'FATAL'=>'31', 'UNKNOWN'=>'37'}
  USE_HUMOROUS_SEVERITIES = true
  def call(severity, time, progname, msg)
    USE_HUMOROUS_SEVERITIES ? formatted_severity = sprintf("%-3s","#{SEVERITY_TO_TAG_MAP[severity]}") : formatted_severity = sprintf("%-5s","#{severity}")
    formatted_time = time.strftime("%Y-%m-%d %H:%M:%S.") << time.usec.to_s[0..2].rjust(3)
    color = SEVERITY_TO_COLOR_MAP[severity]
    "\033[0;37m#{formatted_time}\033[0m [\033[#{color}m#{formatted_severity}\033[0m] #{msg.strip} (pid:#{$$})\n"
  end
end

Rails.logger.formatter = Formatter.new