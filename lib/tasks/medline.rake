require 'net/ftp'

namespace :medline do
  task :download do
    Net::FTP.open('ftp.nlm.nih.gov') do |ftp|
      ftp.login('anonymous', 'ian.connor@gmail.com')
      ftp.chdir('/nlmdata/.medleasebaseline/gz/')
      files = ftp.list('*.md5')
      files += ftp.list('*.gz').reverse
      `mkdir -p /tmp/medline`
      files.each do |line|
        file_name = line.split.last
        puts 'Getting: ' + file_name
        local_file = '/tmp/medline/' + file_name
        ftp.getbinaryfile(file_name, local_file, 1024) unless File.exist?(local_file)
        next if file_name =~ /md5$/
        next unless File.exist?(local_file + '.md5')
        local_md5 = `md5 #{local_file}`.split.last
        medline_md5 = File.open(local_file + '.md5').read.split.last
        unless local_md5 == medline_md5
          `rm #{local_file}`
          `rm #{local_file}.md5`
          throw 'bad md5 for ' + local_file
        end
      end
    end
  end
end
