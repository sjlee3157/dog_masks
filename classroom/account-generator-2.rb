class AccountGenerator2
  attr_accessor :source_choice
  attr_accessor :student_database

  def initialize
    @student_database = Array.new
    @batch_size = 0
  end

  def welcome(batch_size)
    @batch_size = batch_size
    puts "\n", "|" * 140, "\n"
    puts "Welcome to account_generator2.rb.".center(140), "\n"
    puts "Would you like to:" \
         "\t(a) manually enter data for #{@batch_size} students, or"
    puts "\t\t\t(b) import student data?", "\n"
    print "\t\t\t> " # use printf instead

    @source_choice = $stdin.gets.chomp
    until @source_choice == "a" || @source_choice == "b"
      print "Invalid. Try again:\t> " # use printf instead
      @source_choice = $stdin.gets.chomp
    end
    puts "\n"
  end

  def gets_student_names
    # times loop for name entry
    @batch_size.times do |i|
      orphan = Hash.new
      prompt_first = "\tStudent #{i+1}\tFirst name: "
      prompt_last = "\t\t\tLast name: " # use printf instead!!
      print prompt_first
      orphan[:firstname] = $stdin.gets.chomp.upcase
      print prompt_last
      orphan[:lastname] = $stdin.gets.chomp.upcase
      @student_database << orphan
    end
  end

  def import_data(from_names, to_key, display_text)
    i = 0
      if @student_database.size == 0
        from_names.each do |x|
          orphan = Hash.new
          orphan[to_key] = x
          @student_database << orphan
        end
      else
        from_names.each do |x|
          orphan = Hash.new
          orphan[to_key] = x
          @student_database[i].merge!(orphan)
          i += 1
        end
      end
    print display_text, "\t", "#{from_names}", "\n"
  end

  require "io/console"
  def continue(prompt)
    print "\n", prompt
    $stdin.getch
    puts "\n" * 2
  end

  def generate_sids
    # generate unique 6-digit SID from 100_000 to 999_999
    # update database[student][:sid]
    @student_database.each do |student|
      sid = ""
      while (sid == "") || (student.values.include?(sid))
        sid = ""
        sid << (1 + rand(9)).to_s # first digit can't be 0
        5.times do
          sid << (rand(9)).to_s
        end
      end
      student[:sid] = sid
    end
  end

  def generate_emails
    # times loop for email addresses
    # first initial(s) + last name (with symbols removed) + last 3 of SID + @
    first_name_delimiters = [".", " ", "-"]
    @student_database.each do |student|
      first_name = student[:firstname]
      last_name = student[:lastname]
      sid = student[:sid]

      # remove unacceptable characters from last name
      cleaned_up_last_name = last_name.gsub(/\p{^Alnum}/, "")

      # first name to initials
      # can i figure out how to do this with regex instead of looping?
      first_name_initials = first_name.slice(0)
      (1...first_name.size).each do |x|
        is_it_a_delimiter = first_name.slice(x - 1)
        if first_name_delimiters.include?(is_it_a_delimiter)
          first_name_initials << first_name.slice(x)
        end
      end
      first_name_initials = first_name_initials.gsub(/\p{^Alnum}/, "")
      # generate email and store in key-value pair
      email = first_name_initials << cleaned_up_last_name <<
              sid.slice(3..5) << "@adadevelopersacademy.org"
      student[:email] = email
    end
  end

  def print_roster
    # print data in clean columns
    puts "2018-2019 ADA C10 STUDENT ROSTER".center(140), "\n"
    printf("%-30s%-30s%-10s%s\n", "LAST NAME", "FIRST NAME", "SID", "EMAIL")
    puts "\n"
    @student_database.each do |student|
      first = student[:firstname].upcase
      last = student[:lastname].upcase
      id = student[:sid]
      mail = student[:email]
      printf("%-30s%-30s%-10s%s\n", last, first, id, mail)
    end
  end

  def exit
    puts "\n", "|" * 140, "\n"
  end
end

roster2 = AccountGenerator2.new
roster2.welcome(5)

if roster2.source_choice == "a"
  roster2.gets_student_names
end

if roster2.source_choice == "b"
  firstnames = [
    "die-yi", "m'nindee", "ursula k.", "madeleine", "yo-landi", "lala"
  ]
  lastnames = [
    "li", "calangela-scairmp", "le guin", "l'engle", "vi$$er", "c.igarette"
  ]

  roster2.import_data(firstnames, :firstname, "Student First Names: ")
  roster2.import_data(lastnames, :lastname, "Student Last Names: ")
end

roster2.continue("To generate roster, press any key.")
roster2.generate_sids
roster2.generate_emails
roster2.print_roster
roster2.exit
