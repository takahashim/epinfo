require "epinfo/version"
require 'epubinfo'
require 'optparse'

class EPInfo
  def self.output(*args)
    output = EPInfo.new
    output.output(*args)
  end

  def output(*args)

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: epinfo [filename]\n"

      opts.on('-h', '--help', 'show this screen') do
        puts opts
        exit
      end
      opts.on('-v', '--version', 'show version information') do
        puts EPInfo::VERSION
        exit
      end
    end

    begin
      opts.parse!(args)
      if args.size != 1
        #invalid option
        puts opts
        exit
      end
      book = EPUBInfo.get(args[0])
      puts book_desc(book)

    rescue => e
      warn e
    end
  end

  def book_desc(book)
    cover = book.cover
    if cover
      cover = "#{cover.original_file_name}"
    end

    return <<-EOB
titles: #{book.titles.join()}
creators: #{book.creators.map{|c| "#{c.name}(#{c.role||'-'})"}.join(', ')}
subjects: #{book.subjects.join(", ")}
description: #{book.description}
publisher: #{book.publisher}
contributors: #{book.contributors.map{|c| "#{c.name}(#{c.role||'-'})"}.join(', ')}
dates: #{book.dates.map{|d| "#{d.date_str}(#{d.event||'-'})"}.join(', ')}
identifiers: #{book.identifiers.map(&:identifier).join(', ')}
epub_version: #{book.version}
source: #{book.source}
languages: #{book.languages.join(', ')}
rights: #{book.rights}
drm_protected: #{book.drm_protected}
cover: #{cover}
    EOB
  end

end
