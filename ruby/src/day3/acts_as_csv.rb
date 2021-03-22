class CsvRow
  attr :headers, :row

  def initialize(headers, row)
    @headers = headers
    @row = row
  end

  def method_missing(column_name)
    header_index = @headers.find_index { |h| h == column_name.to_s }
    raise StandardError.new("Column \"%s\" does not exist in CSV headers" % column_name) if header_index.nil?
    @row[header_index]
  end
end

class ActsAsCsv
  def self.acts_as_csv
    define_method 'initialize' do
      @result = []
      read
    end

    define_method 'headers' do
      @headers
    end

    define_method 'csv_contents' do
      @result
    end

    # This method was added comparing to the original class.
    define_method 'each' do |&block|
      @result.each do |row|
        block.call(CsvRow.new(@headers, row))
      end
    end

    define_method 'read' do
      file = File.new("%s.txt" % self.class.to_s.downcase)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @result << row.chomp.split(', ')
      end
    end
  end
end

class RubyCsv < ActsAsCsv
  acts_as_csv
end

ruby_csv = RubyCsv.new
ruby_csv.each { |row| puts row.one }